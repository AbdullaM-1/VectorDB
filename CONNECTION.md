# Connecting to the Table Search API (Jina Embeddings + Reranker)

Use these details to call the search API from another script, app, or machine on your network.

---

## 1. Base URL (local)

| Environment | Base URL |
|-------------|----------|
| Same machine, default port (`app.py`) | `http://localhost:5003` |
| Custom port (e.g. `PORT=8080 python app.py`) | `http://localhost:8080` |
| Another machine on LAN | `http://<server-ip>:5003` (or your `PORT`) |

The server binds to `0.0.0.0`, so it accepts connections from other machines on the same network.

---

## 2. How search works

1. **Stage 1 — Jina Embeddings** (`jina-embeddings-v2-small-en`): Pre-computed 512-d vectors for all 352 tables. Query is encoded on the fly, cosine similarity retrieves top 20 candidates. (~0.02s)
2. **Stage 2 — Jina Reranker** (`jina-reranker-v2-base-multilingual`): Cross-encoder re-scores those 20 candidates for accurate relevance ranking. (~2-3 min on CPU)

**Important:** The reranker runs on CPU and each search takes ~2-3 minutes. Set client timeouts to at least **600 seconds**.

---

## 3. Endpoints

### Health check

- **Method:** `GET`
- **URL:** `{BASE_URL}/health`
- **Response (200):** `status`, `service`, `embedding_model`, `reranker_model`, `embedding_model_loaded`, `reranker_loaded`, `embeddings_loaded`, `rerank_candidates`, `persisted_store_present`.

### Stats

- **Method:** `GET`
- **URL:** `{BASE_URL}/stats`
- **Response (200):** `embedding_model`, `reranker_model`, `embedding_model_loaded`, `reranker_loaded`, `table_count`.

### Search

- **Method:** `GET` or `POST`
- **URL:** `{BASE_URL}/search`

**GET**

- Query params: `q` or `query` (required), `k` (optional, default 5).
- Example: `GET {BASE_URL}/search?q=AccountId&k=5`

**POST**

- Body (JSON): `{"query": "your search text", "k": 5}`
  (`q` also accepted instead of `query`)

**Response (200):**

```json
{
  "query": "member payment information",
  "k": 5,
  "results": [
    {
      "table": "MemberPaymentTemplates",
      "file": "MemberPaymentTemplates.sql",
      "snippet": "Table: MemberPaymentTemplates. Definition: ...",
      "score": 0.4722,
      "embedding_score": 0.8195
    }
  ]
}
```

- `table`: table name.
- `file`: source SQL filename.
- `snippet`: truncated document text used for matching.
- `score`: Jina Reranker cross-encoder score (higher is better).
- `embedding_score`: cosine similarity from Jina embeddings (higher is better).

**Error (400):** `{"error": "Missing 'query' or 'q'"}`

### Service info

- **Method:** `GET`
- **URL:** `{BASE_URL}/`
- **Response (200):** JSON with `service` and `endpoints` description.

---

## 4. Configuration (environment)

| Variable | Purpose |
|----------|---------|
| `PORT` | HTTP port (default `5003`). |
| `JINA_EMBEDDING_MODEL` | Jina embedding model (default `jinaai/jina-embeddings-v2-small-en`). |
| `JINA_RERANKER_MODEL` | Jina reranker model (default `jinaai/jina-reranker-v2-base-multilingual`). |
| `RERANK_CANDIDATES` | Number of embedding candidates to send to the reranker (default `10`). |

Re-run `python embed_tables.py` after changing the embedding model.

---

## 5. Python client (same project)

```python
from vector_db_client import VectorDBClient

client = VectorDBClient()  # default: http://localhost:5003, timeout=600s

# Search
results = client.search("AccountId", k=5)
for r in results["results"]:
    print(r["table"], r.get("score"), r.get("embedding_score"))

# Health
ok = client.health()
```

Different host/port:

```python
client = VectorDBClient(base_url="http://192.168.1.10:5003", timeout=600)
```

---

## 6. cURL examples

```bash
# Health
curl http://localhost:5003/health

# Search (GET) — use a long timeout
curl --max-time 600 "http://localhost:5003/search?q=AccountId&k=3"

# Search (POST)
curl --max-time 600 -X POST http://localhost:5003/search \
  -H "Content-Type: application/json" \
  -d '{"query": "Members", "k": 5}'
```

---

## 7. Checklist

1. Create embeddings: `python embed_tables.py` (saves `tables_embeddings.json`).
2. Start the API: `python app.py` (default port **5003**).
3. From the same machine use `http://localhost:5003`; from another use `http://<this-machine-ip>:5003`.
4. Set client timeout to **600s** (reranker is slow on CPU).
5. Ensure firewall allows inbound TCP on the chosen port.
6. No auth is implemented; for LAN-only use.
