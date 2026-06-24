#!/bin/bash
# Kael Workspace Status
# Quick overview of workspace health

cd /home/work/.openclaw/workspace

echo "⚡ Kael Workspace Status"
echo "========================"
echo ""

# Git status
echo "📦 Git:"
BRANCH=$(git branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then
    CHANGES=$(git status --short 2>/dev/null | wc -l)
    LAST_COMMIT=$(git log -1 --format="%ar" 2>/dev/null)
    echo "  Branch: $BRANCH"
    echo "  Uncommitted changes: $CHANGES"
    echo "  Last commit: $LAST_COMMIT"
else
    echo "  Not a git repo"
fi

echo ""

# Memory files
echo "🧠 Memory:"
TODAY=$(date '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d' 2>/dev/null || date -v-1d '+%Y-%m-%d' 2>/dev/null)
echo "  Today's log: $(ls memory/$TODAY.md 2>/dev/null && echo '✅' || echo '❌')"
echo "  Yesterday's log: $(ls memory/$YESTERDAY.md 2>/dev/null && echo '✅' || echo '❌')"
echo "  People: $(ls memory/people/*.md 2>/dev/null | wc -l) files"
echo "  Projects: $(ls memory/projects/*.md 2>/dev/null | wc -l) files"

echo ""

# Disk usage
echo "💾 Disk:"
echo "  Workspace: $(du -sh . 2>/dev/null | cut -f1)"
echo "  Memory: $(du -sh memory/ 2>/dev/null | cut -f1)"

echo ""
echo "Last updated: $(date '+%Y-%m-%d %H:%M:%S %Z')"
