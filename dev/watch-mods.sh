#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

"$SCRIPT_DIR/sync-mods.sh" "$@"

echo ""
echo "Watching for changes to */chrome.css and */theme.json (Ctrl+C to stop)..."

LAST_HASH=""
while true; do
  # Hash the files' contents, so it works the same on Linux and macOS
  CURRENT_HASH="$(find "$REPO_ROOT" -maxdepth 2 \( -name "chrome.css" -o -name "theme.json" \) -type f -print0 | sort -z | xargs -0 cat 2>/dev/null | cksum)"
  if [[ -n "$LAST_HASH" && "$CURRENT_HASH" != "$LAST_HASH" ]]; then
    echo ""
    echo "[$(date '+%H:%M:%S')] Change detected — syncing mods..."
    "$SCRIPT_DIR/sync-mods.sh" "$@"
  fi
  LAST_HASH="$CURRENT_HASH"
  sleep 1
done
