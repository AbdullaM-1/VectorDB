"""
Flask microservice for FAISS vector DB access via LangChain.
Endpoints: add documents, similarity search, health.
"""
import os
from pathlib import Path

from flask import Flask, request, jsonify

from vector_store import (
    get_or_create_vector_store,
    save_vector_store,
    add_documents,
    search,
    INDEX_DIR,
)

app = Flask(__name__)

# Load FAISS index at startup (or create empty)
_vector_store = None


def get_store():
    global _vector_store
    if _vector_store is None:
        _vector_store = get_or_create_vector_store()
    return _vector_store


@app.route("/health", methods=["GET"])
def health():
    """Liveness/readiness check."""
    return jsonify({"status": "ok", "service": "vector-db"})


@app.route("/documents", methods=["POST"])
def documents_add():
    """
    Add documents to the vector store.
    JSON body: { "texts": ["text1", "text2"], "metadatas": [{"source": "a"}, ...] } (metadatas optional)
    """
    try:
        body = request.get_json(force=True) or {}
        texts = body.get("texts") or body.get("documents") or []
        if not texts:
            return jsonify({"error": "Missing 'texts' or 'documents' in body"}), 400
        metadatas = body.get("metadatas")
        store = get_store()
        add_documents(store, texts, metadatas)
        save_vector_store(store)
        return jsonify({"added": len(texts), "message": "Documents added and index saved"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/search", methods=["GET", "POST"])
def search_endpoint():
    """
    Similarity search.
    GET: ?q=query&k=4
    POST: { "query": "...", "k": 4 }
    """
    try:
        if request.method == "GET":
            query = request.args.get("q") or request.args.get("query")
            k = request.args.get("k", 4, type=int)
        else:
            body = request.get_json(force=True) or {}
            query = body.get("query") or body.get("q")
            k = body.get("k", 4)
        if not query:
            return jsonify({"error": "Missing 'query' or 'q'"}), 400
        store = get_store()
        results = search(store, query, k=k)
        return jsonify({"query": query, "k": k, "results": results})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/", methods=["GET"])
def index():
    """Simple service info."""
    return jsonify({
        "service": "FAISS Vector DB (LangChain)",
        "endpoints": {
            "GET /health": "Health check",
            "POST /documents": "Add documents (body: texts, optional metadatas)",
            "GET /search?q=...&k=4": "Similarity search",
            "POST /search": "Similarity search (body: query, k)",
        },
    })


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=os.environ.get("FLASK_DEBUG", "0") == "1")
