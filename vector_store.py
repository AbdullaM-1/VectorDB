"""
FAISS vector store accessed via LangChain.
Handles load/save of index and document store, add documents, similarity search.
"""
import os
from pathlib import Path

from langchain_community.vectorstores import FAISS
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_core.documents import Document


# Default index and docstore paths (can override via env)
INDEX_DIR = Path(os.environ.get("FAISS_INDEX_DIR", "./faiss_index"))


def get_embeddings():
    """Embedding model for vectorizing text. Uses local HuggingFace model by default."""
    return HuggingFaceEmbeddings(
        model_name="sentence-transformers/all-MiniLM-L6-v2",
        model_kwargs={"device": "cpu"},
    )


def get_or_create_vector_store(index_dir: Path = None) -> FAISS:
    """Load existing FAISS index from disk or create a new empty one."""
    index_dir = index_dir or INDEX_DIR
    index_dir = Path(index_dir)
    index_dir.mkdir(parents=True, exist_ok=True)

    embeddings = get_embeddings()
    load_path = index_dir / "faiss_index"

    if (load_path / "index.faiss").exists():
        return FAISS.load_local(
            str(load_path),
            embeddings,
            allow_dangerous_deserialization=True,
        )

    # FAISS needs at least one document to get embedding dimension; use a placeholder
    return FAISS.from_documents(
        [Document(page_content=" ", metadata={"source": "placeholder"})],
        embeddings,
    )


def save_vector_store(store: FAISS, index_dir: Path = None) -> None:
    """Persist FAISS index and docstore to disk."""
    index_dir = index_dir or INDEX_DIR
    index_dir = Path(index_dir)
    index_dir.mkdir(parents=True, exist_ok=True)
    save_path = index_dir / "faiss_index"
    store.save_local(str(save_path))


def add_documents(store: FAISS, texts: list[str], metadatas: list[dict] = None) -> FAISS:
    """Add documents to the store. Returns the same store (updated in place for FAISS)."""
    if metadatas is None:
        metadatas = [{}] * len(texts)
    if len(metadatas) != len(texts):
        metadatas = [{}] * len(texts)
    docs = [
        Document(page_content=text, metadata=meta)
        for text, meta in zip(texts, metadatas)
    ]
    store.add_documents(docs)
    return store


def search(store: FAISS, query: str, k: int = 4) -> list[dict]:
    """Similarity search. Returns list of dicts with 'content' and 'metadata'."""
    results = store.similarity_search_with_score(query, k=k)
    return [
        {"content": doc.page_content, "metadata": doc.metadata, "score": float(score)}
        for doc, score in results
    ]
