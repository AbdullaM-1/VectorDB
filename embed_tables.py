"""
Embed ALL SQL table schemas using OpenAI text-embedding-3-large.

Reads every .sql file from the tables/ folder, converts each DDL + semantic
header into a document string, calls the OpenAI embeddings API, and saves
the result to tables_embeddings.json.

Usage:
    python embed_tables.py
"""
import json
import os
import sys
import time
from pathlib import Path

import numpy as np
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

TABLES_DIR = Path(__file__).resolve().parent / "tables"
_BASE_DIR = Path(__file__).resolve().parent
OUTPUT_JSON = _BASE_DIR / "tables_embeddings.json"
OUTPUT_NPZ = _BASE_DIR / "tables_embeddings.npz"
OUTPUT_META = _BASE_DIR / "tables_metadata.json"
MODEL_ID = "text-embedding-3-large"
BATCH_SIZE = 50


def _read_sql(path: Path) -> str:
    raw = path.read_bytes()
    if len(raw) >= 2 and raw[:2] in (b"\xff\xfe", b"\xfe\xff"):
        return raw.decode("utf-16", errors="replace")
    return raw.decode("utf-8", errors="replace")


def sql_to_document(sql_file: Path) -> str:
    content = _read_sql(sql_file)
    compact = " ".join(content.split())
    return f"Table: {sql_file.stem}. Definition: {compact[:1000]}"


def embed_batch(client: OpenAI, texts: list[str]) -> list[list[float]]:
    resp = client.embeddings.create(model=MODEL_ID, input=texts)
    return [d.embedding for d in resp.data]


def main() -> None:
    sys.stdout.reconfigure(encoding="utf-8")

    if not TABLES_DIR.exists():
        print(f"Folder not found: {TABLES_DIR}")
        return

    sql_files = sorted(TABLES_DIR.glob("*.sql"))
    if not sql_files:
        print(f"No .sql files in {TABLES_DIR}")
        return

    print(f"Found {len(sql_files)} table files to embed.")
    docs = [sql_to_document(f) for f in sql_files]

    client = OpenAI()
    print(f"Embedding with {MODEL_ID} in batches of {BATCH_SIZE} ...")

    all_vecs: list[list[float]] = []
    for start in range(0, len(docs), BATCH_SIZE):
        batch = docs[start : start + BATCH_SIZE]
        batch_num = start // BATCH_SIZE + 1
        total_batches = (len(docs) + BATCH_SIZE - 1) // BATCH_SIZE
        print(f"  Batch {batch_num}/{total_batches} ({len(batch)} docs) ...", end=" ")
        t0 = time.perf_counter()
        vecs = embed_batch(client, batch)
        elapsed = time.perf_counter() - t0
        print(f"{elapsed:.1f}s")
        all_vecs.extend(vecs)

    dim = len(all_vecs[0])

    # --- Save fast binary NPZ (primary) ---
    embeddings_matrix = np.array(all_vecs, dtype=np.float32)
    np.savez_compressed(OUTPUT_NPZ, embeddings=embeddings_matrix)
    print(f"\nSaved NPZ: {OUTPUT_NPZ}  ({OUTPUT_NPZ.stat().st_size / 1024 / 1024:.1f} MB)")

    meta = {
        "model": MODEL_ID,
        "count": len(docs),
        "dim": dim,
        "tables": [
            {"table": f.stem, "file": f.name, "snippet": docs[i][:600]}
            for i, f in enumerate(sql_files)
        ],
    }
    OUTPUT_META.write_text(
        json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    print(f"Saved metadata: {OUTPUT_META}")

    # --- Also save legacy JSON for backward compatibility ---
    payload = {
        "model": MODEL_ID,
        "count": len(docs),
        "dim": dim,
        "tables": [
            {
                "table": f.stem,
                "file": f.name,
                "snippet": docs[i][:600],
                "embedding": all_vecs[i],
            }
            for i, f in enumerate(sql_files)
        ],
    }
    OUTPUT_JSON.write_text(
        json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    print(f"Saved legacy JSON: {OUTPUT_JSON}")
    print(f"Embedding dimension: {dim}")

    # Sanity check
    query = "Which tables store member payment information?"
    print(f'\nSanity check -- query: "{query}"')
    q_resp = client.embeddings.create(model=MODEL_ID, input=[query])
    q_vec = q_resp.data[0].embedding

    mat = np.array(all_vecs, dtype=np.float32)
    qv = np.array(q_vec, dtype=np.float32)
    mat = mat / np.clip(np.linalg.norm(mat, axis=1, keepdims=True), 1e-12, None)
    qv = qv / np.clip(np.linalg.norm(qv), 1e-12, None)
    similarities = (mat @ qv)
    ranked = np.argsort(-similarities)
    print("Top 5 matches:")
    for rank, idx in enumerate(ranked[:5], 1):
        print(f"  {rank}. [{similarities[idx]:.4f}] {sql_files[idx].stem}")


if __name__ == "__main__":
    main()
