#!/usr/bin/env bash
set -o errexit # set -e
set -o pipefail
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_file=$(basename "$0")

echo "I am a $(echo $SHELL) script saying '$(basename "$script_file" .sh)' and I live at '$script_dir'"
