#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

export PATH="$PATH:$HOME/.pub-cache/bin"

ARCH="${1:-arm64}"
BUILD_ENV="${2:-stable}"

case "$ARCH" in
  arm64|amd64) ;;
  *) echo "usage: $0 [arm64|amd64] [stable|pre]" >&2; exit 1 ;;
esac
case "$BUILD_ENV" in
  stable|pre) ;;
  *) echo "usage: $0 [arm64|amd64] [stable|pre]" >&2; exit 1 ;;
esac

for cmd in dart flutter go npm; do
  command -v "$cmd" >/dev/null 2>&1 || { echo "missing dependency: $cmd" >&2; exit 1; }
done

dart ./setup.dart macos --arch "$ARCH" --env "$BUILD_ENV"

echo
echo "dist/:"
ls -lh dist/ || true
