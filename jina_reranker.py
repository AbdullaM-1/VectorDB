"""
Two-stage search: OpenAI embeddings retrieval + Jina Reranker scoring.

Stage 1: OpenAI text-embedding-3-small (cosine similarity, fast API call)
Stage 2: jina-reranker-v2-base-multilingual (cross-encoder, accurate scoring)
"""
from __future__ import annotations

import json
import os
import threading
from pathlib import Path
from typing import Any

import numpy as np
from openai import OpenAI

EMBEDDING_MODEL_ID = "text-embedding-3-large"
RERANKER_MODEL_ID = os.environ.get(
    "JINA_RERANKER_MODEL", "jinaai/jina-reranker-v2-base-multilingual"
)
TABLES_FILE = Path(__file__).resolve().parent / "tables_embeddings.json"
RERANK_CANDIDATES = int(os.environ.get("RERANK_CANDIDATES", "20"))

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
            from transformers import AutoModelForSequenceClassification

            print(f"[jina] Loading reranker: {RERANKER_MODEL_ID} ...")
            m = AutoModelForSequenceClassification.from_pretrained(
                RERANKER_MODEL_ID,
                torch_dtype="auto",
                trust_remote_code=True,
                use_flash_attn=False,
            )
            m.to("cpu")
            m.eval()
            _reranker_model = m
            print("[jina] Reranker ready.")
    return _reranker_model


# ---------------------------------------------------------------------------
# Table documents + pre-computed embeddings
# ---------------------------------------------------------------------------

def is_tables_loaded() -> bool:
    return len(_tables) > 0


def load_tables(path: Path | str | None = None) -> int:
    global _tables, _matrix
    p = Path(path) if path else TABLES_FILE
    if not p.is_file():
        return 0
    with _tables_lock:
        data = json.loads(p.read_text(encoding="utf-8"))
        _tables = data.get("tables", [])
        if _tables and _tables[0].get("embedding"):
            _matrix = np.array(
                [t["embedding"] for t in _tables], dtype=np.float32
            )
            norms = np.linalg.norm(_matrix, axis=1, keepdims=True)
            _matrix = _matrix / np.clip(norms, 1e-12, None)
        else:
            _matrix = None
    return len(_tables)


def tables_file_exists() -> bool:
    return TABLES_FILE.is_file()


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

    similarities = (_matrix @ q_vec)
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

def _rerank(query: str, candidates: list[dict], top_k: int) -> list[dict]:
    if not candidates:
        return []
    reranker = get_reranker()
    texts = [c["snippet"] for c in candidates]
    pairs = [[query, t] for t in texts]

    scores = reranker.compute_score(pairs, max_length=1024)
    if not isinstance(scores, (list, tuple)):
        scores = scores.tolist()

    ranked_idx = sorted(
        range(len(scores)), key=lambda i: scores[i], reverse=True
    )[:top_k]

    return [
        {
            "table": candidates[i]["table"],
            "file": candidates[i]["file"],
            "snippet": candidates[i]["snippet"],
            "score": float(scores[i]),
            "embedding_score": candidates[i].get("embedding_score"),
        }
        for i in ranked_idx
    ]


# ---------------------------------------------------------------------------
# Public search API
# ---------------------------------------------------------------------------

def search(query: str, top_k: int = 5) -> list[dict]:
    """OpenAI embedding retrieval → Jina Reranker scoring."""
    if not query:
        return []

    n_candidates = max(RERANK_CANDIDATES, top_k)
    candidates = _embedding_retrieve(query, top_k=n_candidates)

    if not candidates:
        return []

    return _rerank(query, candidates, top_k=top_k)
