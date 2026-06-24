#!/bin/bash
# Memory Search — Search through all memory files

if [ -z "$1" ]; then
    echo "Usage: bash scripts/memory-search.sh <keyword>"
    echo "Example: bash scripts/memory-search.sh hivemind"
    exit 1
fi

cd /home/work/.openclaw/workspace
KEYWORD="$1"

echo "🔍 Searching memory for: $KEYWORD"
echo "=================================="
echo ""

# Search in all memory files
echo "📁 Memory files:"
grep -r -i "$KEYWORD" memory/ --include="*.md" -l 2>/dev/null | while read f; do
    COUNT=$(grep -c -i "$KEYWORD" "$f" 2>/dev/null)
    echo "  $f ($COUNT matches)"
done

echo ""

# Search in MEMORY.md
echo "📄 MEMORY.md:"
grep -n -i "$KEYWORD" MEMORY.md 2>/dev/null | head -5 || echo "  (no matches)"

echo ""

# Search in notes
echo "📝 Notes:"
grep -r -i "$KEYWORD" notes/ --include="*.md" -l 2>/dev/null | while read f; do
    COUNT=$(grep -c -i "$KEYWORD" "$f" 2>/dev/null)
    echo "  $f ($COUNT matches)"
done

echo ""

# Search in projects
echo "📂 Projects:"
grep -r -i "$KEYWORD" projects/ --include="*.md" -l 2>/dev/null | while read f; do
    COUNT=$(grep -c -i "$KEYWORD" "$f" 2>/dev/null)
    echo "  $f ($COUNT matches)"
done

echo ""
echo "=================================="
echo "Search complete"
