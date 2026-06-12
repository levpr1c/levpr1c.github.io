#!/bin/bash
# gen-posts.sh — scan blog/posts/*.md, generate blog/posts.json (newest first)
cd "$(dirname "$0")/.." || exit 1
OUT="blog/posts.json"
printf '[\n' > "$OUT"
i=0
for f in $(ls -1t blog/posts/*.md 2>/dev/null); do
  slug=$(basename "$f" .md)
  title=$(head -1 "$f" | sed 's/^#[[:space:]]*//')
  date=$(date -r "$f" +%Y-%m-%d)
  [ $i -gt 0 ] && printf ',\n' >> "$OUT"
  printf '  {"slug":"%s","title":"%s","date":"%s"}' "$slug" "$title" "$date" >> "$OUT"
  ((i++))
done
printf '\n]\n' >> "$OUT"
