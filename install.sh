#!/usr/bin/env bash
# Cài bộ cấu hình VibeCoding cho Claude Code vào ~/.claude (dùng cho mọi dự án)
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)/claude"
DEST="$HOME/.claude"
mkdir -p "$DEST/agents" "$DEST/commands"
for f in CLAUDE.md settings.json; do
  if [ -f "$DEST/$f" ]; then cp "$DEST/$f" "$DEST/$f.bak.$(date +%s)"; echo "Đã sao lưu $f"; fi
done
cp "$SRC/CLAUDE.md" "$DEST/CLAUDE.md"
if [ -f "$DEST/settings.json" ] && command -v jq >/dev/null; then
  # Gộp với settings cũ thay vì ghi đè
  jq -s '.[0] as $a | .[1] as $b | ($a * $b) | .permissions.allow = (($a.permissions.allow // []) + ($b.permissions.allow // []) | unique) | .permissions.deny = (($a.permissions.deny // []) + ($b.permissions.deny // []) | unique) | .permissions.ask = (($a.permissions.ask // []) + ($b.permissions.ask // []) | unique)' \
    "$DEST/settings.json" "$SRC/settings.json" > "$DEST/settings.json.tmp"
  mv "$DEST/settings.json.tmp" "$DEST/settings.json"
else
  cp "$SRC/settings.json" "$DEST/settings.json"
fi
cp "$SRC"/agents/*.md "$DEST/agents/"
cp "$SRC"/commands/*.md "$DEST/commands/"
if ! command -v claude >/dev/null; then
  if command -v npm >/dev/null; then npm install -g @anthropic-ai/claude-code
  else echo "⚠ Chưa có Node.js. Cài Node.js 20+ rồi chạy: npm install -g @anthropic-ai/claude-code"; fi
fi
echo "✅ Xong! Agents: $(ls "$DEST/agents" | tr '\n' ' ')"
echo "   Lệnh tắt: /new-app /fix /review /ship /explain /deploy"
