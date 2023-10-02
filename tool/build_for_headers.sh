#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR/../vendor/libvips"

meson setup build \
  --reconfigure \
  --prefix "$PWD/build/install" \
  -Dbundle_deps=enabled \
  -Dauto_features=disabled \
  -Ddeprecated=false

meson install -C build

