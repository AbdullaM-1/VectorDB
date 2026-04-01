"""
Document store backed by Jina Reranker search.

Stage 1: keyword pre-filter (lightweight text matching)
Stage 2: jina-reranker-v2-base-multilingual (cross-encoder scoring)
"""
from jina_reranker import (
    load_tables,
    search as jina_search,
    table_count,
    get_tables,
    tables_file_exists,
)


def load_store() -> int:
    return load_tables()


def persisted_store_exists() -> bool:
    return tables_file_exists()


def document_count() -> int:
    return table_count()


def search(query: str, k: int = 5) -> list[dict]:
    return jina_search(query, top_k=k)
