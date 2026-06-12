#!/bin/bash
# ⚡ Kael Session Startup
# Pulls latest state and shows context summary
# Run at the start of every session

cd /root/.openclaw/workspace

echo "⚡ Kael — Session Starting..."
echo "================================"

# Pull latest from GitHub
echo ""
echo "📥 Pulling latest state..."
git pull origin master --quiet 2>&1

# Show today's date
TODAY=$(date '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d' 2>/dev/null || date -v-1d '+%Y-%m-%d' 2>/dev/null)
echo ""
echo "📅 Today: $TODAY"

# Check if today's memory file exists
if [ -f "memory/$TODAY.md" ]; then
    echo "✅ Today's log exists: memory/$TODAY.md"
    echo "   Last entry:"
    tail -3 "memory/$TODAY.md" | sed 's/^/   /'
else
    echo "⚠️  No log for today yet — creating..."
    echo "# $TODAY — Session Log" > "memory/$TODAY.md"
    echo "" >> "memory/$TODAY.md"
    echo "## Session Start" >> "memory/$TODAY.md"
    echo "- Session started at $(date '+%H:%M')" >> "memory/$TODAY.md"
fi

# Show yesterday's summary if exists
if [ -f "memory/$YESTERDAY.md" ]; then
    echo ""
    echo "📋 Yesterday ($YESTERDAY):"
    head -5 "memory/$YESTERDAY.md" | tail -4 | sed 's/^/   /'
fi

# Show pending reminders from MEMORY.md
echo ""
echo "📌 Standing Reminders:"
grep -A 20 "Standing Reminders" MEMORY.md 2>/dev/null | grep "^-" | head -5 | sed 's/^/   /' || echo "   (none)"

# Show workspace health
echo ""
echo "🏥 Workspace Health:"
echo "   Files: $(find . -not -path './.git/*' -not -path './.openclaw/*' -type f | wc -l) files"
echo "   Memory logs: $(ls memory/20*.md 2>/dev/null | wc -l) daily logs"
echo "   Last commit: $(git log -1 --format='%cr' 2>/dev/null || echo 'none')"

echo ""
echo "================================"
echo "Ready ⚡"
