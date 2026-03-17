"""
Extract table relations from script.sql (SQL Server CREATE/ALTER) and output
a graph of each table's relations in Mermaid, DOT (Graphviz), and JSON.
"""
import re
import json
from pathlib import Path
from collections import defaultdict

SCRIPT_SQL = Path(__file__).parent / "script.sql"
OUT_DIR = Path(__file__).parent / "schema_graph"


def _read_sql(sql_path: Path) -> str:
    """Read SQL file; handle UTF-16 LE (common for SQL Server scripts)."""
    raw = sql_path.read_bytes()
    if raw[:2] in (b"\xff\xfe", b"\xfe\xff"):
        return raw.decode("utf-16", errors="replace")
    return raw.decode("utf-8", errors="replace")


def parse_tables_and_relations(sql_path: Path) -> tuple[set[str], list[tuple[str, str]]]:
    """Parse SQL file: return (set of table names, list of (from_table, to_table) edges)."""
    text = _read_sql(sql_path)
    lines = text.splitlines()
    tables = set()
    edges = []  # (from_table, to_table)

    # All CREATE TABLE [dbo].[TableName]
    for m in re.finditer(r"CREATE TABLE\s+\[dbo\]\.\[([^\]]+)\]", text, re.IGNORECASE):
        tables.add(m.group(1))

    # REFERENCES [dbo].[ToTable] on line i; ALTER TABLE [dbo].[FromTable] ... FOREIGN KEY on line i-1
    alter_pat = re.compile(r"ALTER TABLE\s+\[dbo\]\.\[([^\]]+)\].*FOREIGN KEY", re.IGNORECASE)
    ref_pat = re.compile(r"REFERENCES\s+\[dbo\]\.\[([^\]]+)\]", re.IGNORECASE)
    for i in range(1, len(lines)):
        ref_m = ref_pat.search(lines[i])
        if not ref_m:
            continue
        to_table = ref_m.group(1)
        alt_m = alter_pat.search(lines[i - 1])
        if not alt_m:
            continue
        from_table = alt_m.group(1)
        tables.add(from_table)
        tables.add(to_table)
        edges.append((from_table, to_table))

    return tables, edges


def build_graph(tables: set[str], edges: list[tuple[str, str]]) -> dict:
    """Return graph as { nodes: [...], edges: [{ from, to }, ...] }."""
    return {
        "nodes": sorted(tables),
        "edges": [{"from": a, "to": b} for a, b in edges],
    }


def relations_by_table(edges: list[tuple[str, str]]) -> dict[str, dict]:
    """For each table, list tables it references (outgoing) and tables that reference it (incoming)."""
    out: dict[str, dict] = defaultdict(lambda: {"references": [], "referenced_by": []})
    for a, b in edges:
        out[a]["references"].append(b)
        out[b]["referenced_by"].append(a)
    return dict(out)


def to_mermaid(edges: list[tuple[str, str]], direction: str = "LR") -> str:
    """Generate Mermaid ER diagram (each relation as an edge)."""
    lines = [f"erDiagram", f"    direction {direction}"]
    seen = set()
    for a, b in edges:
        key = (a, b)
        if key in seen:
            continue
        seen.add(key)
        # Mermaid prefers no spaces in node names for links; use quotes if needed
        a_ = a.replace(" ", "_")
        b_ = b.replace(" ", "_")
        lines.append(f"    {a_} ||--o{{ {b_} }} : \"FK\"")
    return "\n".join(lines)


def to_dot(tables: set[str], edges: list[tuple[str, str]]) -> str:
    """Generate Graphviz DOT for rendering (e.g. with dot -Tpng -o graph.png)."""
    lines = ["digraph schema {", "    rankdir=LR;", "    node [shape=box, fontname=Arial];"]
    for t in sorted(tables):
        safe = t.replace('"', '\\"')
        lines.append(f'    "{safe}";')
    for a, b in edges:
        sa, sb = a.replace('"', '\\"'), b.replace('"', '\\"')
        lines.append(f'    "{sa}" -> "{sb}" [label="FK"];')
    lines.append("}")
    return "\n".join(lines)


def main():
    sql_path = SCRIPT_SQL
    if not sql_path.exists():
        print(f"Not found: {sql_path}")
        return

    tables, edges = parse_tables_and_relations(sql_path)
    graph = build_graph(tables, edges)
    by_table = relations_by_table(edges)

    OUT_DIR.mkdir(parents=True, exist_ok=True)

    # JSON: full graph
    graph_path = OUT_DIR / "schema_graph.json"
    graph_path.write_text(json.dumps(graph, indent=2), encoding="utf-8")
    print(f"Wrote {graph_path}")

    # JSON: relations per table (graph of each table's relations)
    by_table_path = OUT_DIR / "relations_by_table.json"
    by_table_path.write_text(json.dumps(by_table, indent=2), encoding="utf-8")
    print(f"Wrote {by_table_path}")

    # Mermaid
    mermaid_path = OUT_DIR / "schema_graph.mmd"
    mermaid_path.write_text(to_mermaid(edges), encoding="utf-8")
    print(f"Wrote {mermaid_path}")

    # DOT
    dot_path = OUT_DIR / "schema_graph.dot"
    dot_path.write_text(to_dot(tables, edges), encoding="utf-8")
    print(f"Wrote {dot_path}")

    print(f"\nSummary: {len(tables)} tables, {len(edges)} relations.")
    print("View Mermaid at https://mermaid.live (paste schema_graph.mmd).")
    print("Render DOT: dot -Tpng schema_graph.dot -o schema_graph.png")


if __name__ == "__main__":
    main()
