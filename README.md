# Python cross-platform skeleton

Multiple Python scripts for **macOS** and **Linux** — interpreted, no build step. Develop and run any script from the same tree.

## Requirements

- Python 3.8+
- Bash (for `run.sh`)

## Quick start

```bash
# List scripts
./run.sh

# Run a script by name (no .py)
./run.sh hello
./run.sh greet
./run.sh greet Alice
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
├── scripts/           # One .py file per runnable script
│   ├── hello.py
│   ├── greet.py
│   └── ...            # Add more here
├── lib/               # Shared code (import from scripts: from lib import ...)
│   └── __init__.py
├── run.sh             # ./run.sh <script> [args...]
└── README.md
```

- **scripts/** — add new scripts as `scripts/<name>.py`; run with `./run.sh <name>`.
- **lib/** — put shared helpers here and use `from lib import ...` in any script so you can develop them together without duplicating code.

## Optional: venv

```bash
python3 -m venv .venv
source .venv/bin/activate   # Linux/macOS
./run.sh hello
```
