"""
Flask microservice for SQL table search.

Stage 1: OpenAI text-embedding-3-small (cosine similarity retrieval via API).
Stage 2: Jina Reranker jina-reranker-v2-base-multilingual (cross-encoder scoring).
"""
import os

from dotenv import load_dotenv
from flask import Flask, request, jsonify

load_dotenv()

from vector_store import (
    search,
    document_count,
    persisted_store_exists,
)
from jina_reranker import (
    EMBEDDING_MODEL_ID,
    RERANKER_MODEL_ID,
    RERANK_CANDIDATES,
    SEARCH_PIPELINE,
    is_reranker_loaded,
    is_tables_loaded,
    get_openai_client,
    get_reranker,
    load_tables,
)

app = Flask(__name__)


def _preload_all():
    """Load table data + embeddings, OpenAI client, and reranker at startup."""
    print("[app] Loading table data + embeddings ...")
    n = load_tables()
    print(f"[app] Loaded {n} tables with embeddings.")

    print("[app] Initialising OpenAI client ...")
    get_openai_client()

    print("[app] Preloading reranker model ...")
    get_reranker()

    print("[app] All ready.")


_preload_all()


@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "ok",
        "service": "table-search (OpenAI Embeddings + Jina Reranker)",
        "embedding_model": EMBEDDING_MODEL_ID,
        "reranker_model": RERANKER_MODEL_ID,
        "reranker_loaded": is_reranker_loaded(),
        "tables_loaded": is_tables_loaded(),
        "rerank_candidates": RERANK_CANDIDATES,
        "persisted_store_present": persisted_store_exists(),
        "search_pipeline": SEARCH_PIPELINE,
        "uses_faiss": False,
    })


@app.route("/stats", methods=["GET"])
def stats():
    try:
        return jsonify({
            "reranker_model": RERANKER_MODEL_ID,
            "reranker_loaded": is_reranker_loaded(),
            "table_count": document_count(),
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/search", methods=["GET", "POST"])
def search_endpoint():
    try:
        if request.method == "GET":
            query = request.args.get("q") or request.args.get("query")
            k = request.args.get("k", 5, type=int)
            want_timing = request.args.get("timing", "0") in ("1", "true", "True", "yes")
        else:
            body = request.get_json(force=True) or {}
            query = body.get("query") or body.get("q")
            k = body.get("k", 5)
            try:
                k = int(k)
            except (TypeError, ValueError):
                k = 5
            wt = body.get("timing", False)
            want_timing = wt in (True, 1, "1", "true", "True", "yes")
        if not query:
            return jsonify({"error": "Missing 'query' or 'q'"}), 400
        if want_timing:
            results, timings = search(query, k=k, return_timing=True)
            payload = {
                "query": query,
                "k": k,
                "results": results,
                "timings": timings,
            }
        else:
            results = search(query, k=k)
            payload = {"query": query, "k": k, "results": results}
        return jsonify(payload)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/", methods=["GET"])
def index():
    return jsonify({
        "service": "Table Search (OpenAI Embeddings + Jina Reranker)",
        "endpoints": {
            "GET /health": "Health check + model status",
            "GET /stats": "Table count and model info",
            "GET /search?q=...&k=5&timing=1": "Search + per-stage timings (no FAISS)",
            "POST /search": "Search tables (body: query, k, timing optional)",
        },
    })


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5003))
    app.run(host="0.0.0.0", port=port, debug=os.environ.get("FLASK_DEBUG", "0") == "1")
