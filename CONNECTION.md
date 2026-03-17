# Connecting to the FAISS Vector DB (Flask API)

Use these details to call the vector DB from another script, app, or machine on your network.

---

## 1. Base URL (local)

| Environment | Base URL |
|-------------|----------|
| Same machine, default port | `http://localhost:5000` |
| Custom port (e.g. `PORT=8080 python app.py`) | `http://localhost:8080` |
| Another machine on LAN | `http://<server-ip>:5000` (e.g. `http://192.168.1.10:5000`) |

The server binds to `0.0.0.0`, so it accepts connections from other machines on the same network.

---

## 2. Endpoints

### Health check

- **Method:** `GET`
- **URL:** `{BASE_URL}/health`
- **Response (200):** `{"status": "ok", "service": "vector-db"}`

### Similarity search

- **Method:** `GET` or `POST`
- **URL:** `{BASE_URL}/search`

**GET**

- Query params: `q` or `query` (required), `k` (optional, default 4)
- Example: `GET {BASE_URL}/search?q=AccountId&k=5`

**POST**

- Body (JSON): `{"query": "your search text", "k": 5}`  
  (`q` also accepted instead of `query`)

**Response (200):**

```json
{
  "query": "AccountId",
  "k": 5,
  "results": [
    {
      "content": "USE [hkietech]\nGO\nCREATE TABLE [dbo].[AccountAddonBillings](...",
      "metadata": {"source": "AccountAddonBillings.sql", "table": "AccountAddonBillings"},
      "score": 0.42
    }
  ]
}
```

- `content`: full text of the matching document (e.g. SQL).
- `metadata`: `source` (filename), `table` (table name).
- `score`: distance (lower = more similar; exact meaning depends on FAISS config).

**Error (400):** `{"error": "Missing 'query' or 'q'"}`

### Add documents

- **Method:** `POST`
- **URL:** `{BASE_URL}/documents`
- **Body (JSON):**

```json
{
  "texts": ["First document text", "Second document text"],
  "metadatas": [{"source": "file1.sql", "table": "MyTable"}, {"source": "file2.sql"}]
}
```

- `texts` (or `documents`): array of strings (required).
- `metadatas`: optional array of objects; length can match `texts` or be omitted.

**Response (200):** `{"added": 2, "message": "Documents added and index saved"}`

**Error (400):** `{"error": "Missing 'texts' or 'documents' in body"}`

### Service info

- **Method:** `GET`
- **URL:** `{BASE_URL}/`
- **Response (200):** JSON with `service` and `endpoints` description.

---

## 3. Headers

- **Content-Type:** `application/json` for POST bodies.
- **Accept:** `application/json` (optional, for clarity).

---

## 4. Python client (same project)

Use the provided client module from any Python file:

```python
from vector_db_client import VectorDBClient

client = VectorDBClient()  # default: http://localhost:5000

# Search
results = client.search("AccountId", k=5)
for r in results["results"]:
    print(r["metadata"].get("table"), r["score"], r["content"][:80])

# Add documents
client.add_documents(["Some SQL or text"], [{"source": "myfile.sql", "table": "MyTable"}])

# Health
ok = client.health()
```

Different host/port:

```python
client = VectorDBClient(base_url="http://192.168.1.10:5000")
```

See `vector_db_client.py` in this folder.

---

## 5. cURL examples

```bash
# Health
curl http://localhost:5000/health

# Search (GET)
curl "http://localhost:5000/search?q=AccountId&k=3"

# Search (POST)
curl -X POST http://localhost:5000/search -H "Content-Type: application/json" -d "{\"query\": \"Members\", \"k\": 4}"

# Add documents
curl -X POST http://localhost:5000/documents -H "Content-Type: application/json" -d "{\"texts\": [\"CREATE TABLE Foo(id int);\"], \"metadatas\": [{\"table\": \"Foo\"}]}"
```

---

## 6. Checklist

1. Start the DB API: `python app.py` (default port 5000).
2. From the same machine use `http://localhost:5000`; from another use `http://<this-machine-ip>:5000`.
3. Ensure firewall allows inbound TCP on the chosen port (e.g. 5000).
4. No auth is implemented; for LAN-only use. Add auth (e.g. API key, JWT) if exposed.
