# FAISS Vector DB Microservice

Flask microservice that exposes a **FAISS** vector database via **LangChain**, with REST API for adding documents and similarity search. Optional **Jina** cross-encoder reranking sits on top of FAISS retrieval.

## Stack

- **FAISS** – vector index (similarity search)
- **LangChain** – `FAISS` vector store and document handling
- **Flask** – HTTP API
- **Embeddings** – OpenAI (`text-embedding-3-small`) by default, or local Hugging Face (e.g. `jinaai/jina-embeddings-v3`) via `EMBEDDING_BACKEND=huggingface`
- **Reranker (optional)** – `jinaai/jina-reranker-v2-base-multilingual` when `JINA_RERANKER_ENABLED=1`

## Setup

```bash
cd VectorDB
python -m venv .venv
.venv\Scripts\activate   # Windows
# source .venv/bin/activate   # Linux/macOS
pip install -r requirements.txt
```

Set `OPENAI_API_KEY` in the environment (or `.env`) when using OpenAI embeddings.

## Run

```bash
python app.py
```

Service listens on `http://0.0.0.0:5003` by default. Override with `PORT=8080 python app.py`.

## API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Service info and endpoint list |
| GET | `/health` | Health check, embedding and Jina flags |
| GET | `/stats` | Load index and return `vector_count` |
| POST | `/documents` | Add documents to the vector store |
| GET | `/search?q=...&k=4` | Similarity search (`fetch_k`, `rerank` optional) |
| POST | `/search` | Similarity search (JSON: `query`, `k`, optional `fetch_k`, `rerank`) |

Search responses include `rerank_applied` and, when reranking runs, each hit may include `rerank_score` in addition to `score` (FAISS distance).

### Add documents

```bash
curl -X POST http://localhost:5003/documents \
  -H "Content-Type: application/json" \
  -d "{\"texts\": [\"First document text\", \"Second document\"], \"metadatas\": [{\"source\": \"doc1\"}, {\"source\": \"doc2\"}]}"
```

`metadatas` is optional.

### Search

```bash
# GET
curl "http://localhost:5003/search?q=your+query&k=4"

# POST
curl -X POST http://localhost:5003/search \
  -H "Content-Type: application/json" \
  -d "{\"query\": \"your query\", \"k\": 4, \"rerank\": false}"
```

## Configuration

- **`FAISS_INDEX_DIR`** – Directory for FAISS index and docstore (default: `./faiss_index`).
- **`PORT`** – Server port (default: `5003`).
- **`EMBEDDING_BACKEND`** – `openai` or `huggingface`.
- **`JINA_RERANKER_ENABLED`** – `1` to enable Jina reranking after FAISS (default `0`).
- **`JINA_PRELOAD_RERANKER`** – `1` to load the reranker at startup (per worker).

See **CONNECTION.md** for the full environment variable list.

Rebuild the index (`python index_tables_to_faiss.py`) after changing embedding backend or model; vector dimension must match the index.

## Build index from `tables/*.sql`

```bash
python index_tables_to_faiss.py
```

Then start `app.py` and use `/search` or `/stats` to confirm `vector_count`.
