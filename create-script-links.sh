#!/usr/bin/env bash
# Create symlinks in bin/ for each script in scripts/ (run from repo root).
# Supports both .py and .sh scripts. Each link points at ../run.sh.
# Skips creating a link if one already exists in bin/.

set -e
cd "$(dirname "$0")"
ROOT="$(pwd)"
BIN_DIR="${ROOT}/bin"
TARGET="../run.sh"   # relative to bin/ so bin/hello -> ../run.sh

mkdir -p "$BIN_DIR"

for f in scripts/*.py scripts/*.sh; do
  [[ -f "$f" ]] || continue
  base=$(basename "$f")
  name="${base%.*}"
  linkpath="${BIN_DIR}/${name}"
  if [[ -e "$linkpath" ]]; then
    echo "skip (exists): bin/$name"
  else
    ln -s "$TARGET" "$linkpath"
    echo "created: bin/$name -> $TARGET"
  fi
done
