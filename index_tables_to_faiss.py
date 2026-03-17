"""
Load all SQL table files from tables/ into the FAISS vector store.
Run once to populate the index so the Flask app can search over table definitions.
"""
from pathlib import Path

from langchain_core.documents import Document

from vector_store import (
    get_embeddings,
    save_vector_store,
    INDEX_DIR,
)
from langchain_community.vectorstores import FAISS

TABLES_DIR = Path(__file__).parent / "tables"


def _read_sql(path: Path) -> str:
    """Read SQL file; handle UTF-16 if present."""
    raw = path.read_bytes()
    if len(raw) >= 2 and raw[:2] in (b"\xff\xfe", b"\xfe\xff"):
        return raw.decode("utf-16", errors="replace")
    return raw.decode("utf-8", errors="replace")


def main():
    if not TABLES_DIR.exists():
        print(f"Folder not found: {TABLES_DIR}")
        return

    sql_files = sorted(TABLES_DIR.glob("*.sql"))
    if not sql_files:
        print(f"No .sql files in {TABLES_DIR}")
        return

    texts = []
    metadatas = []
    for path in sql_files:
        try:
            content = _read_sql(path)
        except Exception as e:
            print(f"Skip {path.name}: {e}")
            continue
        table_name = path.stem
        texts.append(content)
        metadatas.append({"source": path.name, "table": table_name})

    docs = [
        Document(page_content=text, metadata=meta)
        for text, meta in zip(texts, metadatas)
    ]
    print(f"Building FAISS index for {len(docs)} table documents...")
    embeddings = get_embeddings()
    store = FAISS.from_documents(docs, embeddings)
    save_vector_store(store)
    print(f"Saved index to {INDEX_DIR / 'faiss_index'}")
    print("Done. You can query via the Flask app (e.g. GET /search?q=AccountId).")


if __name__ == "__main__":
    main()
