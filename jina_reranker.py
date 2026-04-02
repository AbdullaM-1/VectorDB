"""
Two-stage search: OpenAI embeddings retrieval + Jina Reranker scoring.

Stage 1: OpenAI text-embedding-3-large (cosine similarity, fast API call)
Stage 2: jina-reranker-v2-base-multilingual (cross-encoder, accurate scoring)
"""
from __future__ import annotations

import json
import os
import time
import threading
from pathlib import Path
from typing import Any

import numpy as np
from openai import OpenAI

EMBEDDING_MODEL_ID = "text-embedding-3-large"
RERANKER_MODEL_ID = os.environ.get(
    "JINA_RERANKER_MODEL", "jinaai/jina-reranker-v2-base-multilingual"
)
_BASE_DIR = Path(__file__).resolve().parent
TABLES_NPZ_FILE = _BASE_DIR / "tables_embeddings.npz"
TABLES_META_FILE = _BASE_DIR / "tables_metadata.json"
TABLES_JSON_FILE = _BASE_DIR / "tables_embeddings.json"
RERANK_CANDIDATES = int(os.environ.get("RERANK_CANDIDATES", "20"))
RERANK_MAX_LENGTH = int(os.environ.get("RERANK_MAX_LENGTH", "512"))

# What /search actually runs (no FAISS in this codebase — README may be outdated).
SEARCH_PIPELINE = (
    "stage1: OpenAI embeds the query; cosine similarity vs precomputed table vectors "
    "(NumPy matrix @ query, not FAISS). "
    "stage2: Jina cross-encoder reranks the top RERANK_CANDIDATES candidates."
)

_openai_client: OpenAI | None = None
_openai_lock = threading.Lock()

_reranker_model: Any = None
_reranker_lock = threading.Lock()

_tables: list[dict] = []
_matrix: np.ndarray | None = None
_tables_lock = threading.Lock()


# ---------------------------------------------------------------------------
# OpenAI client (Stage 1)
# ---------------------------------------------------------------------------

def get_openai_client() -> OpenAI:
    global _openai_client
    if _openai_client is not None:
        return _openai_client
    with _openai_lock:
        if _openai_client is None:
            _openai_client = OpenAI()
            print("[openai] Client initialised.")
    return _openai_client


# ---------------------------------------------------------------------------
# Reranker model (Stage 2)
# ---------------------------------------------------------------------------

def is_reranker_loaded() -> bool:
    return _reranker_model is not None


def get_reranker():
    global _reranker_model
    if _reranker_model is not None:
        return _reranker_model
    with _reranker_lock:
        if _reranker_model is None:
            import torch
            from transformers import AutoModelForSequenceClassification

            t0 = time.perf_counter()
            print(f"[jina] Loading reranker: {RERANKER_MODEL_ID} ...")
            m = AutoModelForSequenceClassification.from_pretrained(
                RERANKER_MODEL_ID,
                torch_dtype="auto",
                trust_remote_code=True,
                use_flash_attn=False,
            )
            m.to("cpu")
            m.eval()

            try:
                m = torch.compile(m, mode="reduce-overhead")
                print("[jina] torch.compile() applied (reduce-overhead mode).")
            except Exception as exc:
                print(f"[jina] torch.compile() skipped: {exc}")

            _reranker_model = m
            print(f"[jina] Reranker ready ({time.perf_counter() - t0:.1f}s).")
    return _reranker_model


# ---------------------------------------------------------------------------
# Table documents + pre-computed embeddings
# ---------------------------------------------------------------------------

def is_tables_loaded() -> bool:
    return len(_tables) > 0


def _load_from_npz() -> tuple[list[dict], np.ndarray | None]:
    """Fast binary load: ~50-100x faster than JSON for the embedding matrix."""
    meta = json.loads(TABLES_META_FILE.read_text(encoding="utf-8"))
    tables = meta.get("tables", [])
    npz = np.load(TABLES_NPZ_FILE)
    matrix = npz["embeddings"].astype(np.float32)
    norms = np.linalg.norm(matrix, axis=1, keepdims=True)
    matrix = matrix / np.clip(norms, 1e-12, None)
    return tables, matrix


def _load_from_json(path: Path) -> tuple[list[dict], np.ndarray | None]:
    """Legacy JSON load -- slower but works as fallback."""
    data = json.loads(path.read_text(encoding="utf-8"))
    tables = data.get("tables", [])
    matrix = None
    if tables and tables[0].get("embedding"):
        matrix = np.array(
            [t["embedding"] for t in tables], dtype=np.float32
        )
        norms = np.linalg.norm(matrix, axis=1, keepdims=True)
        matrix = matrix / np.clip(norms, 1e-12, None)
        for t in tables:
            t.pop("embedding", None)
    return tables, matrix


def load_tables(path: Path | str | None = None) -> int:
    global _tables, _matrix
    t0 = time.perf_counter()

    with _tables_lock:
        if path is None and TABLES_NPZ_FILE.is_file() and TABLES_META_FILE.is_file():
            print("[tables] Loading from NPZ (fast binary) ...")
            _tables, _matrix = _load_from_npz()
        else:
            p = Path(path) if path else TABLES_JSON_FILE
            if not p.is_file():
                return 0
            print("[tables] Loading from JSON (slow, run migrate_to_npz.py) ...")
            _tables, _matrix = _load_from_json(p)

    elapsed = time.perf_counter() - t0
    print(f"[tables] Loaded {len(_tables)} tables in {elapsed:.2f}s.")
    return len(_tables)


def tables_file_exists() -> bool:
    return TABLES_NPZ_FILE.is_file() or TABLES_JSON_FILE.is_file()


def table_count() -> int:
    return len(_tables)


def get_tables() -> list[dict]:
    return list(_tables)


# ---------------------------------------------------------------------------
# Stage 1 — OpenAI embedding retrieval (cosine similarity)
# ---------------------------------------------------------------------------

def _embedding_retrieve(query: str, top_k: int) -> list[dict]:
    if _matrix is None or not _tables:
        return []

    client = get_openai_client()
    resp = client.embeddings.create(model=EMBEDDING_MODEL_ID, input=[query])
    q_vec = np.array(resp.data[0].embedding, dtype=np.float32)
    q_vec = q_vec / np.clip(np.linalg.norm(q_vec), 1e-12, None)

    similarities = _matrix @ q_vec
    ranked_idx = np.argsort(-similarities)[:top_k]

    return [
        {
            "table": _tables[i]["table"],
            "file": _tables[i]["file"],
            "snippet": _tables[i].get("snippet", ""),
            "embedding_score": float(similarities[i]),
        }
        for i in ranked_idx
    ]


# ---------------------------------------------------------------------------
# Stage 2 — Jina Reranker cross-encoder scoring
# ---------------------------------------------------------------------------

def _rerank(
    query: str, candidates: list[dict], top_k: int
) -> tuple[list[dict], float]:
    """Returns (ranked_results, rerank_seconds)."""
    if not candidates:
        return [], 0.0
    import torch

    reranker = get_reranker()
    texts = [c["snippet"] for c in candidates]
    pairs = [[query, t] for t in texts]

    t0 = time.perf_counter()
    with torch.inference_mode():
        scores = reranker.compute_score(pairs, max_length=RERANK_MAX_LENGTH)
    elapsed = time.perf_counter() - t0
    print(f"[rerank] {len(pairs)} pairs scored in {elapsed:.2f}s "
          f"(max_length={RERANK_MAX_LENGTH})")

    if not isinstance(scores, (list, tuple)):
        scores = scores.tolist()

    ranked_idx = sorted(
        range(len(scores)), key=lambda i: scores[i], reverse=True
    )[:top_k]

    out = [
        {
            "table": candidates[i]["table"],
            "file": candidates[i]["file"],
            "snippet": candidates[i]["snippet"],
            "score": float(scores[i]),
            "embedding_score": candidates[i].get("embedding_score"),
        }
        for i in ranked_idx
    ]
    return out, elapsed


# ---------------------------------------------------------------------------
# Public search API
# ---------------------------------------------------------------------------

def search(
    query: str, top_k: int = 5, return_timing: bool = False
) -> list[dict] | tuple[list[dict], dict[str, Any]]:
    """OpenAI embedding retrieval -> Jina Reranker scoring.

    Not FAISS: stage 1 is OpenAI query embedding + NumPy dot-product vs all rows.
    """
    if not query:
        if return_timing:
            return [], {"error": "empty_query"}
        return []

    t_total = time.perf_counter()

    n_candidates = max(RERANK_CANDIDATES, top_k)

    t0 = time.perf_counter()
    candidates = _embedding_retrieve(query, top_k=n_candidates)
    stage1_s = time.perf_counter() - t0
    print(f"[search] Stage 1 (embedding retrieve): {stage1_s:.2f}s")

    if not candidates:
        if return_timing:
            return [], {
                "stage1_retrieval_s": round(stage1_s, 4),
                "stage2_rerank_s": 0.0,
                "total_s": round(time.perf_counter() - t_total, 4),
                "pipeline": SEARCH_PIPELINE,
            }
        return []

    results, rerank_s = _rerank(query, candidates, top_k=top_k)
    total_s = time.perf_counter() - t_total
    print(f"[search] Total: {total_s:.2f}s")

    if return_timing:
        timing: dict[str, Any] = {
            "stage1_retrieval_s": round(stage1_s, 4),
            "stage2_rerank_s": round(rerank_s, 4),
            "total_s": round(total_s, 4),
            "candidates_reranked": len(candidates),
            "pipeline": SEARCH_PIPELINE,
            "uses_faiss": False,
        }
        return results, timing
    return results
