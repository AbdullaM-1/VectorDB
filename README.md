# FAISS Vector DB Microservice

Flask microservice that exposes a **FAISS** vector database via **LangChain**, with REST API for adding documents and similarity search.

## Stack

- **FAISS** – vector index (similarity search)
- **LangChain** – `FAISS` vector store and document handling
- **Flask** – HTTP API
- **Embeddings** – `sentence-transformers` (local, no API key) by default

## Setup

```bash
cd VectorDB
python -m venv .venv
.venv\Scripts\activate   # Windows
# source .venv/bin/activate   # Linux/macOS
pip install -r requirements.txt
```

## Run

```bash
python app.py
```

Service runs at `http://0.0.0.0:5000`. Override port with `PORT=8080 python app.py`.

## API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Service info and endpoint list |
| GET | `/health` | Health check |
| POST | `/documents` | Add documents to the vector store |
| GET | `/search?q=...&k=4` | Similarity search |
| POST | `/search` | Similarity search (JSON body) |

### Add documents

```bash
curl -X POST http://localhost:5000/documents \
  -H "Content-Type: application/json" \
  -d "{\"texts\": [\"First document text\", \"Second document\"], \"metadatas\": [{\"source\": \"doc1\"}, {\"source\": \"doc2\"}]}"
```

`metadatas` is optional.

### Search

```bash
# GET
curl "http://localhost:5000/search?q=your+query&k=4"

# POST
curl -X POST http://localhost:5000/search \
  -H "Content-Type: application/json" \
  -d "{\"query\": \"your query\", \"k\": 4}"
```

## Configuration

- **`FAISS_INDEX_DIR`** – Directory for FAISS index and docstore (default: `./faiss_index`).
- **`PORT`** – Server port (default: `5000`).

## Optional: OpenAI embeddings

For OpenAI embeddings, install `langchain-openai`, set `OPENAI_API_KEY`, and in `vector_store.py` switch to:

```python
from langchain_openai import OpenAIEmbeddings
def get_embeddings():
    return OpenAIEmbeddings(model="text-embedding-3-small")
```

Rebuild the index after changing the embedding model (delete `faiss_index/` and re-add documents).
