"""
Convert tables_embeddings.json to fast binary format:
  - tables_embeddings.npz  (numpy matrix, ~50-100x faster to load)
  - tables_metadata.json   (table names, files, snippets -- tiny without vectors)

Usage:
    python migrate_to_npz.py
"""
import json
import time
from pathlib import Path

import numpy as np

BASE = Path(__file__).resolve().parent
JSON_FILE = BASE / "tables_embeddings.json"
NPZ_FILE = BASE / "tables_embeddings.npz"
META_FILE = BASE / "tables_metadata.json"


def main() -> None:
    if not JSON_FILE.is_file():
        print(f"Not found: {JSON_FILE}")
        return

    print(f"Reading {JSON_FILE.name} ...")
    t0 = time.perf_counter()
    data = json.loads(JSON_FILE.read_text(encoding="utf-8"))
    print(f"  JSON parse: {time.perf_counter() - t0:.2f}s")

    tables = data.get("tables", [])
    if not tables:
        print("No tables found.")
        return

    embeddings = np.array(
        [t["embedding"] for t in tables], dtype=np.float32
    )
    print(f"  Matrix shape: {embeddings.shape}  "
          f"({embeddings.nbytes / 1024 / 1024:.1f} MB)")

    t0 = time.perf_counter()
    np.savez_compressed(NPZ_FILE, embeddings=embeddings)
    print(f"  Saved {NPZ_FILE.name} in {time.perf_counter() - t0:.2f}s "
          f"({NPZ_FILE.stat().st_size / 1024 / 1024:.1f} MB on disk)")

    meta = {
        "model": data.get("model"),
        "count": len(tables),
        "dim": embeddings.shape[1],
        "tables": [
            {"table": t["table"], "file": t["file"], "snippet": t.get("snippet", "")}
            for t in tables
        ],
    }
    META_FILE.write_text(
        json.dumps(meta, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    print(f"  Saved {META_FILE.name} "
          f"({META_FILE.stat().st_size / 1024:.0f} KB)")

    print("\nVerifying ...")
    t0 = time.perf_counter()
    loaded = np.load(NPZ_FILE)["embeddings"]
    print(f"  NPZ load: {time.perf_counter() - t0:.4f}s  (vs JSON parse above)")
    assert loaded.shape == embeddings.shape
    assert np.allclose(loaded, embeddings)
    print("  OK -- matrices match.")

    print(f"\nDone. You can now delete {JSON_FILE.name} "
          f"(or keep it as backup).")


if __name__ == "__main__":
    main()
