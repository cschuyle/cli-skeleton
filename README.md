# Python cross-platform skeleton

Multiple Python scripts for **macOS** and **Linux** — interpreted, no build step. Develop and run any script from the same tree.

## Requirements

- Python 3.8+
- Bash (for `run.sh`)

## Quick start

```bash
# Create bin/hello, bin/greet, etc. (run once or after adding scripts)
./create-script-links.sh

# Run via bin/
./bin/hello
./bin/greet Alice
./bin/hi

# Or via run.sh: list scripts or run by name
./run.sh
./run.sh hello
./run.sh greet Alice
./run.sh hi
```

Or run a script directly (from repo root so `lib` is importable):

```bash
export PYTHONPATH="$(pwd):$PYTHONPATH"
python3 scripts/hello.py
python3 scripts/greet.py Alice
```

## Layout

```
.
├── bin/                     # Symlinks to run.sh (one per script); run ./create-script-links.sh to create
├── scripts/                 # One .py file per runnable script
│   ├── hello.py
│   ├── greet.py
│   ├── hi.sh
│   └── ...
├── lib/                     # Shared code (import from scripts: from lib import ...)
│   └── __init__.py
├── create-script-links.sh   # Creates bin/<name> links for each scripts/<name>.py
├── run.sh                   # ./run.sh <script> [args...]; also used by bin/ links
└── README.md
```

**`scripts/`**

Add new scripts as `scripts/<name>.py`; run with `./run.sh <name>`.
**`lib/`**

Put shared helpers here and use `from lib import ...` in any script so you can develop them together without duplicating code.

**`bin/`**

Directory of symlinks, one per script (e.g. `bin/hello` → `../run.sh`). Run a script as `./bin/hello` or `./bin/greet Alice`. Not committed; create links with `create-script-links.sh`.

**`create-script-links.sh`**

Run from the repo root. Creates a symlink in `bin/` for each `scripts/*.py` (e.g. `bin/hello`, `bin/greet`). Skips creating a link if `bin/<name>` already exists. Run after adding a new script to get a `bin/<name>` shortcut.

## Optional: venv

```bash
python3 -m venv .venv
source .venv/bin/activate   # Linux/macOS
./run.sh hello
```
