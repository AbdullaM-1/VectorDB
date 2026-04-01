"""
Test the Jina two-stage search (embeddings + reranker) against the Flask API.

Usage:
    python test_search.py
"""
import json
import sys
import time
import urllib.error
import urllib.request

BASE = "http://127.0.0.1:5003"

TEST_QUERIES = [
    ("member payment information", 5),
    ("club account legal name", 5),
    ("attendance log check-in", 5),
    ("staff trainer booking", 5),
    ("billing invoice item", 5),
    ("membership types and subscriptions", 5),
    ("prospect communication history", 5),
    ("class schedule swim", 5),
    ("credit card failed payment", 5),
    ("rewards program points", 5),
    ("student cancelled classes", 3),
    ("POS transaction till summary", 3),
    ("email campaign marketing", 3),
    ("digital signature verification", 3),
    ("workout exercise body part", 3),
]


def api_post(path, body, timeout=300):
    url = f"{BASE}{path}"
    req = urllib.request.Request(url, method="POST")
    req.add_header("Content-Type", "application/json")
    req.data = json.dumps(body).encode("utf-8")
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.loads(resp.read().decode("utf-8"))


def api_get(path, timeout=300):
    url = f"{BASE}{path}"
    req = urllib.request.Request(url)
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.loads(resp.read().decode("utf-8"))


def flush_print(*args, **kwargs):
    print(*args, **kwargs)
    sys.stdout.flush()


def main():
    sys.stdout.reconfigure(encoding="utf-8")

    flush_print("Waiting for server ...", end="")
    for _ in range(30):
        try:
            d = api_get("/health")
            if d.get("status") == "ok":
                break
        except Exception:
            pass
        time.sleep(1)
        flush_print(".", end="")
    flush_print(" ready!\n")

    health = api_get("/health")
    flush_print(f"Service          : {health.get('service')}")
    flush_print(f"Embedding model  : {health.get('embedding_model')}")
    flush_print(f"Reranker model   : {health.get('reranker_model')}")
    flush_print(f"Rerank candidates: {health.get('rerank_candidates')}")
    flush_print(f"Reranker loaded  : {health.get('reranker_loaded')}")
    flush_print("=" * 70)

    total_time = 0
    for idx, (query, k) in enumerate(TEST_QUERIES):
        flush_print(f'\n[{idx+1}/{len(TEST_QUERIES)}] Query: "{query}" (k={k}) ...', end=" ")
        t0 = time.perf_counter()
        result = api_post("/search", {"query": query, "k": k})
        elapsed = time.perf_counter() - t0
        total_time += elapsed
        flush_print(f"{elapsed:.1f}s")
        flush_print("-" * 60)
        for i, r in enumerate(result.get("results", []), 1):
            reranker = r.get("score")
            emb = r.get("embedding_score")
            r_str = f"{reranker:.4f}" if isinstance(reranker, (int, float)) else "?"
            e_str = f"{emb:.4f}" if isinstance(emb, (int, float)) else "?"
            flush_print(f"  {i}. reranker={r_str}  emb={e_str}  {r['table']}")
        if not result.get("results"):
            flush_print("  (no results)")

    flush_print("\n" + "=" * 70)
    flush_print(f"Ran {len(TEST_QUERIES)} searches in {total_time:.1f}s total")
    flush_print(f"Average: {total_time / len(TEST_QUERIES):.1f}s per query")


if __name__ == "__main__":
    main()
