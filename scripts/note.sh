#!/bin/bash
# ⚡ Quick Note
# Append a timestamped note to today's daily log
# Usage: bash scripts/note.sh "note content"

if [ -z "$1" ]; then
    echo "Usage: bash scripts/note.sh \"note content\""
    exit 1
fi

cd /root/.openclaw/workspace

TODAY=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M')
FILE="memory/$TODAY.md"

# Create today's log if it doesn't exist
if [ ! -f "$FILE" ]; then
    echo "# $TODAY — Session Log" > "$FILE"
    echo "" >> "$FILE"
fi

# Append the note
echo "- [$TIME] $1" >> "$FILE"
echo "✅ Note added to $FILE"
