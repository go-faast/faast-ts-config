#!/bin/bash

set -e

if [ $# -lt 1 ]; then
  echo "Usage: docs.sh <project_root_dir>"
  exit 1
fi
ROOT_DIR="$1"
LIB_DIR="$(dirname $0)/.."
NM_BIN="$ROOT_DIR/node_modules/.bin"

OPTIONS_NAME="typedoc.js"
OPTIONS="$ROOT_DIR/$OPTIONS_NAME"
if [ ! -f "$OPTIONS" ]; then
  echo "Using default $OPTIONS_NAME from @faast/ts-config/library"
  OPTIONS="$LIB_DIR/$OPTIONS_NAME"
fi

echo ">> typedoc"
"$NM_BIN/typedoc" --options "$OPTIONS"
