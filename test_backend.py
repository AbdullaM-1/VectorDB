"""
Test script for the FAISS vector DB Flask backend.
Run with the backend already running: python app.py

Usage:
    python test_backend.py
    python test_backend.py --base http://localhost:5000
"""
import argparse
import json
import sys
import urllib.error
import urllib.request

BASE_URL = "http://localhost:5000"


def request(method: str, url: str, body: dict = None) -> tuple[int, dict | list]:
    """Send request, return (status_code, parsed_json)."""
    req = urllib.request.Request(url, method=method)
    req.add_header("Accept", "application/json")
    if body is not None:
        req.add_header("Content-Type", "application/json")
        req.data = json.dumps(body).encode("utf-8")
    try:
        # Search can be slow on first request (loads FAISS + embedding model)
        timeout = 60 if "/search" in url or "/documents" in url else 10
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            data = resp.read().decode("utf-8")
            return resp.status, json.loads(data) if data else {}
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8")
        try:
            return e.code, json.loads(body)
        except json.JSONDecodeError:
            return e.code, {"raw": body}
    except urllib.error.URLError as e:
        print(f"  ERROR: Could not connect - {e.reason}")
        return 0, {}


def test_health(base: str) -> bool:
    """GET /health -> 200, status ok."""
    print("  GET /health ... ", end="", flush=True)
    status, data = request("GET", f"{base}/health")
    ok = status == 200 and isinstance(data, dict) and data.get("status") == "ok"
    print("PASS" if ok else f"FAIL (status={status}, body={data})")
    return ok


def test_index(base: str) -> bool:
    """GET / -> 200, has service info."""
    print("  GET / ... ", end="", flush=True)
    status, data = request("GET", base + "/")
    ok = status == 200 and isinstance(data, dict) and "service" in data
    print("PASS" if ok else f"FAIL (status={status})")
    return ok


def test_search_get(base: str) -> bool:
    """GET /search?q=AccountId&k=3 -> 200, results list with content/metadata/score."""
    print("  GET /search?q=AccountId&k=3 ... ", end="", flush=True)
    status, data = request("GET", f"{base}/search?q=AccountId&k=3")
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    if not isinstance(data.get("results"), list):
        print(f"FAIL (no 'results' list: {list(data.keys())})")
        return False
    results = data["results"]
    for i, r in enumerate(results):
        if not isinstance(r, dict) or "content" not in r or "metadata" not in r:
            print(f"FAIL (result[{i}] missing content/metadata)")
            return False
    print(f"PASS (got {len(results)} results)")
    return True


def test_search_post(base: str) -> bool:
    """POST /search with JSON body -> 200, same shape."""
    print("  POST /search (query=Members) ... ", end="", flush=True)
    status, data = request("POST", f"{base}/search", body={"query": "Members", "k": 2})
    if status != 200:
        print(f"FAIL (status={status}, body={data})")
        return False
    if not isinstance(data.get("results"), list):
        print(f"FAIL (no 'results' list)")
        return False
    print(f"PASS (got {len(data['results'])} results)")
    return True


def test_search_missing_query(base: str) -> bool:
    """GET /search without q -> 400."""
    print("  GET /search (no query) -> expect 400 ... ", end="", flush=True)
    status, data = request("GET", f"{base}/search")
    ok = status == 400 and isinstance(data, dict) and "error" in data
    print("PASS" if ok else f"FAIL (status={status})")
    return ok


def test_documents_add(base: str) -> bool:
    """POST /documents with one doc -> 200, then search finds it."""
    print("  POST /documents (add one doc) ... ", end="", flush=True)
    status, data = request(
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
    print("  GET /search?q=unique_phrase_xyz_123&k=1 ... ", end="", flush=True)
    status2, data2 = request("GET", f"{base}/search?q=unique_phrase_xyz_123&k=1")
    ok = status2 == 200 and data2.get("results") and "unique_phrase_xyz_123" in (
        data2["results"][0].get("content", "")
    )
    print("PASS" if ok else "FAIL (search did not return added doc)")
    return ok


def main():
    global BASE_URL
    parser = argparse.ArgumentParser(description="Test FAISS vector DB Flask backend")
    parser.add_argument("--base", default=BASE_URL, help="Base URL (default: http://localhost:5000)")
    args = parser.parse_args()
    base = args.base.rstrip("/")

    print(f"Testing backend at {base}\n")
    tests = [
        ("Health", test_health),
        ("Index (service info)", test_index),
        ("Search GET", test_search_get),
        ("Search POST", test_search_post),
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
