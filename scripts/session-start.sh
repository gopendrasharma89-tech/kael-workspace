#!/bin/bash
# Kael Session Startup
# Run this at the start of every session

cd /home/work/.openclaw/workspace

echo "⚡ Kael waking up..."

# Pull latest
git pull origin main --quiet 2>/dev/null

# Check if today's memory exists
TODAY=$(date '+%Y-%m-%d')
if [ ! -f "memory/$TODAY.md" ]; then
    echo "📝 Creating today's memory file..."
    echo "# $TODAY — Session Log" > "memory/$TODAY.md"
    echo "" >> "memory/$TODAY.md"
    echo "## Notes" >> "memory/$TODAY.md"
fi

# Quick status
bash scripts/status.sh

echo ""
echo "Ready! ⚡"
