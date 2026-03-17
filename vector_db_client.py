"""
Client to connect to the FAISS Vector DB Flask API from another file or project.
Uses only the standard library (no requests required).

Example:
    from vector_db_client import VectorDBClient
    client = VectorDBClient()
    results = client.search("AccountId", k=5)
    client.add_documents(["text"], [{"table": "MyTable"}])
"""
import json
import urllib.error
import urllib.request
from typing import Any


class VectorDBClient:
    """Client for the FAISS vector DB Flask API."""

    def __init__(self, base_url: str = "http://localhost:5000", timeout: int = 60):
        """
        Args:
            base_url: API base URL (e.g. http://localhost:5000).
            timeout: Timeout in seconds for search/document requests (first call can be slow).
        """
        self.base_url = base_url.rstrip("/")
        self.timeout = timeout

    def _request(
        self, method: str, path: str, body: dict | None = None
    ) -> tuple[int, dict[str, Any]]:
        """Send request. Returns (status_code, json_body)."""
        url = f"{self.base_url}{path}"
        req = urllib.request.Request(url, method=method)
        req.add_header("Accept", "application/json")
        if body is not None:
            req.add_header("Content-Type", "application/json")
            req.data = json.dumps(body).encode("utf-8")
        try:
            with urllib.request.urlopen(req, timeout=self.timeout) as resp:
                data = resp.read().decode("utf-8")
                return resp.status, json.loads(data) if data else {}
        except urllib.error.HTTPError as e:
            data = e.read().decode("utf-8")
            try:
                return e.code, json.loads(data)
            except json.JSONDecodeError:
                return e.code, {"error": data}
        except urllib.error.URLError as e:
            return 0, {"error": str(e.reason)}

    def health(self) -> bool:
        """Check if the API is up. Returns True if status is ok."""
        status, data = self._request("GET", "/health")
        return status == 200 and data.get("status") == "ok"

    def search(self, query: str, k: int = 4) -> dict[str, Any]:
        """
        Similarity search.

        Args:
            query: Search text.
            k: Max number of results (default 4).

        Returns:
            {"query": ..., "k": ..., "results": [{"content": ..., "metadata": {...}, "score": ...}, ...]}
            On error: {"error": "..."} and results may be missing.
        """
        status, data = self._request(
            "POST", "/search", body={"query": query, "k": k}
        )
        if status != 200:
            return {"error": data.get("error", data), "results": []}
        return data

    def add_documents(
        self,
        texts: list[str],
        metadatas: list[dict] | None = None,
    ) -> dict[str, Any]:
        """
        Add documents to the vector store.

        Args:
            texts: List of document strings.
            metadatas: Optional list of dicts (e.g. [{"source": "a.sql", "table": "A"}]).

        Returns:
            {"added": n, "message": "..."} on success, or {"error": "..."} on failure.
        """
        body = {"texts": texts}
        if metadatas is not None:
            body["metadatas"] = metadatas
        status, data = self._request("POST", "/documents", body=body)
        if status != 200:
            return {"error": data.get("error", data)}
        return data

    def info(self) -> dict[str, Any]:
        """Get service info (GET /)."""
        status, data = self._request("GET", "/")
        return data if status == 200 else {"error": data}


# Convenience: use from another file without creating a class instance
_default_client: VectorDBClient | None = None


def get_client(base_url: str = "http://localhost:5000") -> VectorDBClient:
    """Return a shared client instance (or create one)."""
    global _default_client
    if _default_client is None:
        _default_client = VectorDBClient(base_url=base_url)
    return _default_client
