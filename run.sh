#!/usr/bin/env bash
# Run a script by name. Usage: ./run.sh <script> [args...]
# Or link: ln -s run.sh greet  then ./greet [args...] runs scripts/greet.py
# Scripts live in scripts/*.py; shared code in lib/.

set -e
# ROOT = directory containing run.sh (resolve symlink when invoked via bin/<name>)
SCRIPT_PATH="$0"
BINDIR=$(cd "$(dirname "$SCRIPT_PATH")" && pwd)
if [[ -L "$0" ]]; then
  TARGET=$(readlink "$0")
  ROOT=$(cd "$BINDIR" && cd "$(dirname "$TARGET")" && pwd)
else
  ROOT="$BINDIR"
fi
cd "$ROOT"
export PYTHONPATH="${ROOT}:${PYTHONPATH}"

INVOKED_AS=$(basename "$0")

# If invoked via a link (e.g. ./greet), use link name as script name
if [[ "$INVOKED_AS" != "run.sh" ]]; then
  NAME="$INVOKED_AS"
  SCRIPT="${ROOT}/scripts/${NAME}.py"
  if [[ ! -f "$SCRIPT" ]]; then
    echo "No script: scripts/${NAME}.py" >&2
    exit 1
  fi
  exec python3 "$SCRIPT" "$@"
fi

# Invoked as run.sh: first arg is script name, or no args = list
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <script> [args...]"
  echo ""
  echo "Scripts:"
  for f in scripts/*.py; do
    [[ -f "$f" ]] || continue
    base=$(basename "$f" .py)
    echo "  $base  →  python3 scripts/${base}.py"
  done
  exit 0
fi

NAME="$1"
shift
SCRIPT="${ROOT}/scripts/${NAME}.py"
if [[ ! -f "$SCRIPT" ]]; then
  echo "No script: scripts/${NAME}.py" >&2
  exit 1
fi
exec python3 "$SCRIPT" "$@"
