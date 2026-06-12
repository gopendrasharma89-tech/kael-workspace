#!/bin/bash
# ⚡ Memory Search
# Search across all memory files for a keyword/phrase
# Usage: bash scripts/search-memory.sh "search term"

if [ -z "$1" ]; then
    echo "Usage: bash scripts/search-memory.sh \"search term\""
    exit 1
fi

cd /root/.openclaw/workspace

QUERY="$1"
echo "🔍 Searching memory for: \"$QUERY\""
echo "================================"

# Search in all memory files
RESULTS=$(grep -rn -i --include="*.md" "$QUERY" memory/ MEMORY.md 2>/dev/null)

if [ -z "$RESULTS" ]; then
    echo "❌ No results found."
    exit 0
fi

# Count results
COUNT=$(echo "$RESULTS" | wc -l)
echo "📊 Found $COUNT result(s):"
echo ""

echo "$RESULTS" | while IFS= read -r line; do
    FILE=$(echo "$line" | cut -d: -f1)
    LINE_NUM=$(echo "$line" | cut -d: -f2)
    CONTENT=$(echo "$line" | cut -d: -f3-)
    echo "📄 $FILE:$LINE_NUM"
    echo "   $CONTENT"
    echo ""
done

echo "================================"
