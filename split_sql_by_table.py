"""
Split script.sql into one file per table. Each file contains:
- CREATE TABLE for that table
- All ALTER TABLE batches that target that table (constraints, FKs, etc.)
- All EXEC sys.sp_addextendedproperty for that table

All output files go into a single folder (default: tables/).
"""
import re
from pathlib import Path
from collections import defaultdict

SCRIPT_SQL = Path(__file__).parent / "script.sql"
OUT_FOLDER = Path(__file__).parent / "tables"


def _read_sql(sql_path: Path) -> str:
    """Read SQL file; handle UTF-16 LE (common for SQL Server scripts)."""
    raw = sql_path.read_bytes()
    if len(raw) >= 2 and raw[:2] in (b"\xff\xfe", b"\xfe\xff"):
        return raw.decode("utf-16", errors="replace")
    return raw.decode("utf-8", errors="replace")


def _split_batches(text: str) -> list[str]:
    """Split script into batches on line that is only GO (case-insensitive)."""
    lines = text.splitlines()
    batches = []
    current = []
    for line in lines:
        if line.strip().upper() == "GO":
            if current:
                batches.append("\n".join(current))
            current = []
        else:
            current.append(line)
    if current:
        batches.append("\n".join(current))
    return batches


def _table_from_create(batch: str) -> str | None:
    m = re.search(r"CREATE\s+TABLE\s+\[dbo\]\.\[([^\]]+)\]", batch, re.IGNORECASE)
    return m.group(1) if m else None


def _table_from_alter(batch: str) -> str | None:
    m = re.search(r"ALTER\s+TABLE\s+\[dbo\]\.\[([^\]]+)\]", batch, re.IGNORECASE)
    return m.group(1) if m else None


def _table_from_exec(batch: str) -> str | None:
    # @level1name=N'TableName' or @level1name=N"TableName"
    m = re.search(r"@level1name\s*=\s*N['\"]([^'\"]+)['\"]", batch, re.IGNORECASE)
    return m.group(1) if m else None


def _safe_filename(table_name: str) -> str:
    """Safe file name (no path chars, no reserved names)."""
    safe = re.sub(r'[<>:"/\\|?*]', "_", table_name).strip()
    return safe or "unnamed"


def main():
    if not SCRIPT_SQL.exists():
        print(f"Not found: {SCRIPT_SQL}")
        return

    text = _read_sql(SCRIPT_SQL)
    batches = _split_batches(text)

    # table_name -> list of (order_key, batch) so we output CREATE first, then ALTER, then EXEC
    by_table = defaultdict(list)
    batch_index = 0
    for batch in batches:
        batch = batch.strip()
        if not batch:
            batch_index += 1
            continue

        table = None
        order_key = 1  # default ALTER

        if re.search(r"CREATE\s+TABLE\s+\[dbo\]", batch, re.IGNORECASE):
            table = _table_from_create(batch)
            order_key = 0  # CREATE first
        elif re.search(r"ALTER\s+TABLE\s+\[dbo\]", batch, re.IGNORECASE):
            table = _table_from_alter(batch)
        elif "sp_addextendedproperty" in batch and "@level1name" in batch:
            table = _table_from_exec(batch)
            order_key = 2  # EXEC last

        if table:
            by_table[table].append((order_key, batch_index, batch))
        batch_index += 1

    OUT_FOLDER.mkdir(parents=True, exist_ok=True)
    header = "USE [hkietech]\nGO\nSET ANSI_NULLS ON\nGO\nSET QUOTED_IDENTIFIER ON\nGO\n"

    written = 0
    for table_name in sorted(by_table.keys()):
        items = by_table[table_name]
        items.sort(key=lambda x: (x[0], x[1]))  # order by type then original index
        content = header + "\nGO\n".join(batch for _, _, batch in items) + "\nGO\n"
        filename = _safe_filename(table_name) + ".sql"
        out_path = OUT_FOLDER / filename
        out_path.write_text(content, encoding="utf-8")
        written += 1

    print(f"Wrote {written} table scripts to {OUT_FOLDER.absolute()}")


if __name__ == "__main__":
    main()
