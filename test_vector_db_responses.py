"""
Test script: run many commands against the Vector DB API, capture all responses,
and store them in a file. Use to verify how the vector DB is responding.

Usage:
    python test_vector_db_responses.py
    python test_vector_db_responses.py --base http://localhost:5000
    python test_vector_db_responses.py --out my_report.json
"""
import argparse
import json
import sys
import time
from datetime import datetime
from pathlib import Path

# Use local client
sys.path.insert(0, str(Path(__file__).resolve().parent))
from vector_db_client import VectorDBClient


# Max length of content to store in report (full response still in JSON)
MAX_CONTENT_PREVIEW = 200

OUTPUT_JSON = Path(__file__).parent / "vector_db_test_responses.json"
OUTPUT_TXT = Path(__file__).parent / "vector_db_test_responses.txt"


def truncate(s: str, max_len: int = MAX_CONTENT_PREVIEW) -> str:
    if not isinstance(s, str):
        return str(s)
    return s[:max_len] + "..." if len(s) > max_len else s


def run_tests(base_url: str) -> list[dict]:
    """Run all test commands and return list of {name, request, response, status, duration_sec}."""
    client = VectorDBClient(base_url=base_url)
    results = []

    def record(name: str, request_info: dict, status: int, body: dict, duration: float):
        results.append({
            "name": name,
            "request": request_info,
            "status_code": status,
            "response": body,
            "duration_sec": round(duration, 3),
            "timestamp": datetime.utcnow().isoformat() + "Z",
        })

    # ---- Health ----
    t0 = time.perf_counter()
    status, data = client._request("GET", "/health")
    record("GET /health", {"method": "GET", "path": "/health"}, status, data, time.perf_counter() - t0)

    # ---- Service info ----
    t0 = time.perf_counter()
    status, data = client._request("GET", "/")
    record("GET / (service info)", {"method": "GET", "path": "/"}, status, data, time.perf_counter() - t0)

    # ---- Search: various queries ----
    search_queries = [
        ("AccountId", 3),
        ("Members", 4),
        ("FOREIGN KEY", 3),
        ("billing invoice", 4),
        ("CREATE TABLE", 2),
        ("Staff Trainer", 3),
        ("MembershipType", 3),
        ("Payment Gateway", 2),
        ("ProductCategory", 2),
    ]
    for query, k in search_queries:
        t0 = time.perf_counter()
        status, out = client._request("POST", "/search", body={"query": query, "k": k})
        record(
            f"POST /search (q={query!r}, k={k})",
            {"method": "POST", "path": "/search", "body": {"query": query, "k": k}},
            status,
            out,
            time.perf_counter() - t0,
        )

    # ---- Search: GET style (via client POST, but we record as search) ----
    t0 = time.perf_counter()
    status, data = client._request("GET", "/search?q=AccountId&k=2")
    record("GET /search?q=AccountId&k=2", {"method": "GET", "path": "/search?q=AccountId&k=2"}, status, data, time.perf_counter() - t0)

    # ---- Search: missing query (expect 400) ----
    t0 = time.perf_counter()
    status, data = client._request("POST", "/search", body={"k": 5})
    record("POST /search (no query, expect 400)", {"method": "POST", "path": "/search", "body": {"k": 5}}, status, data, time.perf_counter() - t0)

    # ---- Search: empty string query ----
    t0 = time.perf_counter()
    status, out = client._request("POST", "/search", body={"query": "", "k": 1})
    record("POST /search (empty query)", {"method": "POST", "path": "/search", "body": {"query": "", "k": 1}}, status, out, time.perf_counter() - t0)

    # ---- Add documents ----
    t0 = time.perf_counter()
    status, add_resp = client._request(
        "POST",
        "/documents",
        body={
            "texts": ["Test table VectorDB_Test_Table (id int, name varchar(100));"],
            "metadatas": [{"source": "test_vector_db_responses.py", "table": "VectorDB_Test_Table"}],
        },
    )
    record(
        "POST /documents (add one test doc)",
        {
            "method": "POST",
            "path": "/documents",
            "body": {"texts": ["Test table VectorDB_Test_Table (...)"], "metadatas": [{"table": "VectorDB_Test_Table"}]},
        },
        status,
        add_resp,
        time.perf_counter() - t0,
    )

    # ---- Search for the doc we just added ----
    t0 = time.perf_counter()
    status, out = client._request("POST", "/search", body={"query": "VectorDB_Test_Table", "k": 1})
    record(
        "POST /search (find added doc)",
        {"method": "POST", "path": "/search", "body": {"query": "VectorDB_Test_Table", "k": 1}},
        status,
        out,
        time.perf_counter() - t0,
    )

    # ---- Search with large k ----
    t0 = time.perf_counter()
    status, out = client._request("POST", "/search", body={"query": "Account", "k": 10})
    record(
        "POST /search (q=Account, k=10)",
        {"method": "POST", "path": "/search", "body": {"query": "Account", "k": 10}},
        status,
        out,
        time.perf_counter() - t0,
    )

    return results


def write_json_report(results: list[dict], path: Path) -> None:
    """Write full responses to JSON (for debugging; content can be long)."""
    report = {
        "run_at": datetime.utcnow().isoformat() + "Z",
        "total_tests": len(results),
        "passed": sum(1 for r in results if r["status_code"] in (200,)),
        "tests": results,
    }
    path.write_text(json.dumps(report, indent=2, default=str), encoding="utf-8")


def write_txt_report(results: list[dict], path: Path) -> None:
    """Write human-readable summary with truncated content."""
    lines = [
        "=" * 60,
        "Vector DB test responses",
        "Run at: " + datetime.utcnow().isoformat() + "Z",
        "=" * 60,
        "",
    ]
    passed = 0
    for r in results:
        status = r["status_code"]
        if status == 200:
            passed += 1
        lines.append(f"[{'PASS' if status == 200 else 'FAIL'}] {r['name']}")
        lines.append(f"  Request:  {r['request']}")
        lines.append(f"  Status:   {status}")
        lines.append(f"  Duration: {r['duration_sec']} s")
        resp = r["response"]
        if "results" in resp and isinstance(resp["results"], list):
            lines.append(f"  Results:  {len(resp['results'])} items")
            for i, item in enumerate(resp["results"][:3]):
                meta = item.get("metadata", {})
                score = item.get("score", "?")
                content_preview = truncate(item.get("content", ""), 120)
                lines.append(f"    [{i+1}] table={meta.get('table', '?')} score={score} content={content_preview!r}")
            if len(resp["results"]) > 3:
                lines.append(f"    ... and {len(resp['results']) - 3} more")
        elif "error" in resp:
            lines.append(f"  Error:    {resp['error']}")
        else:
            # Truncate any long string in response
            out = json.dumps(resp, indent=2, default=str)
            if len(out) > 500:
                out = out[:500] + "\n  ... (truncated)"
            lines.append(f"  Response: {out}")
        lines.append("")
    lines.append("=" * 60)
    lines.append(f"Summary: {passed}/{len(results)} tests returned HTTP 200")
    lines.append("=" * 60)
    path.write_text("\n".join(lines), encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Test Vector DB and save responses to file")
    parser.add_argument("--base", default="http://localhost:5000", help="Base URL of the Vector DB API")
    parser.add_argument("--out", default=None, help="Base name for output files (default: vector_db_test_responses)")
    args = parser.parse_args()
    base = args.base.rstrip("/")
    out_base = args.out or "vector_db_test_responses"
    out_dir = Path(__file__).resolve().parent
    json_path = out_dir / f"{out_base}.json"
    txt_path = out_dir / f"{out_base}.txt"

    print(f"Testing Vector DB at {base}")
    print("Running commands and capturing responses...\n")
    results = run_tests(base)

    write_json_report(results, json_path)
    write_txt_report(results, txt_path)

    passed = sum(1 for r in results if r["status_code"] == 200)
    print(f"Done. {passed}/{len(results)} tests returned HTTP 200.")
    print(f"  Full responses (JSON): {json_path}")
    print(f"  Readable report:       {txt_path}")
    sys.exit(0 if passed == len(results) else 1)


if __name__ == "__main__":
    main()
