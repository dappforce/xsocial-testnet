#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=$SCRIPT_DIR/..

set -e

cargo build --release --locked --features try-runtime --workspace
"$ROOT_DIR"/target/release/xsocial-node try-runtime \
--runtime "$ROOT_DIR/target/release/wbuild/xsocial-runtime/xsocial_runtime.compact.compressed.wasm" \
--chain=dev on-runtime-upgrade --checks=all live --uri wss://xsocial.subsocial.network:443
