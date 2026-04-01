"""
Test script for the Document Search Flask backend (Jina Reranker).
Run with the backend already running: python app.py (default port 5003)

Usage:
    python test_backend.py
    python test_backend.py --base http://localhost:5003
"""
import argparse
import json
import sys
import time
import urllib.error
import urllib.request

BASE_URL = "http://localhost:5003"


def wait_for_server(base: str, max_wait: float = 45.0) -> bool:
    deadline = time.monotonic() + max_wait
    while time.monotonic() < deadline:
        status, data = do_request("GET", f"{base}/health")
        if status == 200 and isinstance(data, dict) and data.get("status") == "ok":
            return True
        time.sleep(0.4)
    return False


def do_request(method: str, url: str, body: dict = None) -> tuple[int, dict | list]:
    req = urllib.request.Request(url, method=method)
    req.add_header("Accept", "application/json")
    if body is not None:
        req.add_header("Content-Type", "application/json")
        req.data = json.dumps(body).encode("utf-8")
    try:
        timeout = 120 if "/search" in url or "/documents" in url or "/stats" in url else 10
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            data = resp.read().decode("utf-8")
            return resp.status, json.loads(data) if data else {}
    except urllib.error.HTTPError as e:
        body_text = e.read().decode("utf-8")
        try:
            return e.code, json.loads(body_text)
        except json.JSONDecodeError:
            return e.code, {"raw": body_text}
    except urllib.error.URLError as e:
        print(f"  ERROR: Could not connect - {e.reason}")
        return 0, {}


def test_health(base: str) -> bool:
    print("  GET /health ... ", end="", flush=True)
    status, data = do_request("GET", f"{base}/health")
    ok = (
        status == 200
        and isinstance(data, dict)
        and data.get("status") == "ok"
        and "persisted_store_present" in data
        and data.get("reranker_model")
    )
    print("PASS" if ok else f"FAIL (status={status}, body={data})")
    return ok


def test_stats(base: str) -> bool:
    print("  GET /stats ... ", end="", flush=True)
    status, data = do_request("GET", f"{base}/stats")
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    n = data.get("document_count")
    if not isinstance(n, int) or n < 1:
        print(f"FAIL (unexpected document_count={n!r})")
        return False
    print(f"PASS (document_count={n})")
    return True


def test_index(base: str) -> bool:
    print("  GET / ... ", end="", flush=True)
    status, data = do_request("GET", base + "/")
    ok = status == 200 and isinstance(data, dict) and "service" in data
    print("PASS" if ok else f"FAIL (status={status})")
    return ok


def test_search_get(base: str) -> bool:
    print("  GET /search?q=AccountId&k=3 ... ", end="", flush=True)
    status, data = do_request("GET", f"{base}/search?q=AccountId&k=3")
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    if not isinstance(data.get("results"), list):
        print(f"FAIL (no 'results' list: {list(data.keys())})")
        return False
    results = data["results"]
    for i, r in enumerate(results):
        if not isinstance(r, dict) or "content" not in r or "metadata" not in r or "score" not in r:
            print(f"FAIL (result[{i}] missing content/metadata/score)")
            return False
    print(f"PASS (got {len(results)} results)")
    return True


def test_search_post(base: str) -> bool:
    print("  POST /search (query=Members) ... ", end="", flush=True)
    status, data = do_request("POST", f"{base}/search", body={"query": "Members", "k": 2})
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    if not isinstance(data.get("results"), list):
        print(f"FAIL (no 'results' list)")
        return False
    print(f"PASS (got {len(data['results'])} results)")
    return True


def test_search_semantic_club(base: str) -> bool:
    print("  GET /search?q=club+account+legal+name&k=5 ... ", end="", flush=True)
    status, data = do_request("GET", f"{base}/search?q=club+account+legal+name&k=5")
    if status != 200:
        print(f"FAIL (status={status})")
        return False
    tables = {r.get("metadata", {}).get("table") for r in data.get("results", [])}
    if "Accounts" not in tables:
        print(f"FAIL (expected Accounts in top results, got tables={tables})")
        return False
    print("PASS (Accounts in results)")
    return True


def test_search_missing_query(base: str) -> bool:
    print("  GET /search (no query) -> expect 400 ... ", end="", flush=True)
    status, data = do_request("GET", f"{base}/search")
    ok = status == 400 and isinstance(data, dict) and "error" in data
    print("PASS" if ok else f"FAIL (status={status})")
    return ok


def test_documents_add(base: str) -> bool:
    print("  POST /documents (add one doc) ... ", end="", flush=True)
    status, data = do_request(
        "POST",
        f"{base}/documents",
        body={
            "texts": ["Test table for backend: unique_phrase_xyz_123"],
            "metadatas": [{"source": "test_backend.py", "table": "TestTable"}],
        },
    )
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    print("PASS")
    print("  POST /search (find unique_phrase_xyz_123) ... ", end="", flush=True)
    status2, data2 = do_request("POST", f"{base}/search", body={"query": "unique_phrase_xyz_123", "k": 1})
    ok = status2 == 200 and data2.get("results") and "unique_phrase_xyz_123" in (
        data2["results"][0].get("content", "")
    )
    print("PASS" if ok else "FAIL (search did not return added doc)")
    return ok


def main():
    global BASE_URL
    parser = argparse.ArgumentParser(description="Test Document Search Flask backend")
    parser.add_argument("--base", default=BASE_URL, help="Base URL (default: http://localhost:5003)")
    args = parser.parse_args()
    base = args.base.rstrip("/")

    print(f"Testing backend at {base}\n")
    print("  Waiting for /health ... ", end="", flush=True)
    if not wait_for_server(base):
        print("FAIL (server did not respond in time)")
        sys.exit(1)
    print("ok\n")
    tests = [
        ("Health", test_health),
        ("Stats (loaded store)", test_stats),
        ("Index (service info)", test_index),
        ("Search GET", test_search_get),
        ("Search POST", test_search_post),
        ("Search semantic (Accounts)", test_search_semantic_club),
        ("Search missing query (400)", test_search_missing_query),
        ("Documents add + search", test_documents_add),
    ]
    passed = 0
    for name, fn in tests:
        print(f"[{name}]")
        if fn(base):
            passed += 1
        print()
    print(f"Result: {passed}/{len(tests)} tests passed")
    sys.exit(0 if passed == len(tests) else 1)


if __name__ == "__main__":
    main()
