#!/bin/bash

set -e

if [ $# -lt 1 ]; then
  echo "Usage: build.sh <project_root_dir>"
  exit 1
fi
ROOT_DIR="$1"
LIB_DIR="`cd $(dirname $0)/..; echo $PWD`"
NM_BIN="$ROOT_DIR/node_modules/.bin"

TSCONFIG_NAME="tsconfig.build.json"
TSCONFIG="$ROOT_DIR/$TSCONFIG_NAME"
if [ ! -f "$TSCONFIG" ]; then
  echo "Missing required build file: $TSCONFIG_NAME"
  exit 1
fi

ROLLUP_CONFIG_NAME="rollup.config.js"
ROLLUP_CONFIG="$ROOT_DIR/$ROLLUP_CONFIG_NAME"
if [ ! -f "$ROLLUP_CONFIG" ]; then
  echo "Missing required build file: $ROLLUP_CONFIG_NAME"
  exit 1
fi

echo ">> tsc"
"$NM_BIN/tsc" -b "$TSCONFIG"

echo ">> rollup"
"$NM_BIN/rollup" -c "$ROLLUP_CONFIG"

if [ "$NO_DOCS" != '1' ]; then
  DOCS_SH="$ROOT_DIR/bin/docs.sh"
  if [ ! -f "$DOCS_SH" ]; then
    DOCS_SH="$LIB_DIR/bin/docs.sh"
  fi
  "$DOCS_SH" "$ROOT"
fi
