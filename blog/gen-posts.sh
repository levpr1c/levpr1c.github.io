#!/bin/bash
cd "$(dirname "$0")/.." || exit 1
OUT="blog/posts.json"
TMP=$(mktemp)
find blog/posts/ -maxdepth 1 -name '*.md' -printf '%T@\t%p\0' | sort -rn > "$TMP"
printf '[\n' > "$OUT"
i=0
while IFS=$'\t' read -r -d '' ts f; do
  [ -z "$f" ] && continue
  slug=$(basename "$f" .md)
  title=$(head -1 "$f" | sed 's/^#[[:space:]]*//')
  date=$(date -r "$f" +%Y-%m-%d)
  [ $i -gt 0 ] && printf ',\n' >> "$OUT"
  printf '  {"slug":"%s","title":"%s","date":"%s"}' "$slug" "$title" "$date" >> "$OUT"
  ((i++))
done < "$TMP"
rm "$TMP"
printf '\n]\n' >> "$OUT"
