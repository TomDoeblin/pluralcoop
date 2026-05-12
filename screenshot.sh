#!/bin/bash
# Screenshots index.html using Chrome headless
# Usage: ./screenshot.sh [output.png] [width]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HTML="$SCRIPT_DIR/index.html"
OUT="${1:-$SCRIPT_DIR/screenshot.png}"
WIDTH="${2:-1440}"
HEIGHT="${3:-900}"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [ ! -f "$HTML" ]; then
  echo "No index.html found in $SCRIPT_DIR" >&2
  exit 1
fi

"$CHROME" \
  --headless \
  --disable-gpu \
  --no-sandbox \
  --screenshot="$OUT" \
  --window-size="$WIDTH,$HEIGHT" \
  "file://$HTML" 2>/dev/null

echo "Screenshot saved: $OUT"
