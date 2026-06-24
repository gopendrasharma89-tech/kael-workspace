#!/bin/bash
# Kael Session Startup — Run at the start of every session

set -e
cd /home/work/.openclaw/workspace

echo "⚡ Kael waking up..."
echo ""

# Pull latest from GitHub backup
echo "📦 Syncing with GitHub..."
git pull origin main --quiet 2>/dev/null || echo "  ⚠️ Git pull failed (might not have remote)"

# Create today's memory file if missing
TODAY=$(date '+%Y-%m-%d')
if [ ! -f "memory/$TODAY.md" ]; then
    echo "📝 Creating today's memory file..."
    cat > "memory/$TODAY.md" << EOF
# $TODAY — Session Log

## Notes

EOF
fi

# Quick status
echo ""
bash scripts/status.sh

echo ""
echo "Ready! ⚡"
