#!/usr/bin/env bash
# Manual internal Markdown link check (no CI). Run when you change many cross-links
# or before a big docs merge. Requires lychee: https://lychee.cli.rs
#
# Usage (from repo root):
#   ./scripts/check-doc-links.sh

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! command -v lychee >/dev/null 2>&1; then
  echo "lychee not found. Install one of:"
  echo "  macOS:  brew install lychee"
  echo "  cargo:  cargo install lychee"
  echo "  see:    https://github.com/lycheeverse/lychee"
  exit 1
fi

exec lychee --offline --verbose --no-progress --exclude-path .git './**/*.md'
