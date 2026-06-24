#!/bin/bash
# Kael Workspace Stats — Detailed overview

cd /home/work/.openclaw/workspace 2>/dev/null || { echo "❌ Workspace not found"; exit 1; }

echo "⚡ Kael Workspace Stats Dashboard"
echo "=================================="
echo ""

# Basic info
echo "📅 Date: $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "👤 Owner: Hrithik (Gopendra Sharma)"
echo "🤖 Agent: Kael ⚡"
echo ""

# Git info
echo "📦 GIT STATUS"
echo "─────────────"
BRANCH=$(git branch --show-current 2>/dev/null)
COMMITS=$(git rev-list --count HEAD 2>/dev/null)
CHANGES=$(git status --short 2>/dev/null | wc -l)
LAST=$(git log -1 --format="%ar — %s" 2>/dev/null)
echo "  Branch: $BRANCH"
echo "  Total commits: $COMMITS"
echo "  Uncommitted: $CHANGES"
echo "  Last: $LAST"
echo ""

# File counts
echo "📁 FILE COUNTS"
echo "──────────────"
echo "  Core files: $(ls *.md 2>/dev/null | wc -l)"
echo "  Memory daily: $(ls memory/*.md 2>/dev/null | wc -l)"
echo "  Memory people: $(ls memory/people/*.md 2>/dev/null | wc -l)"
echo "  Memory projects: $(ls memory/projects/*.md 2>/dev/null | wc -l)"
echo "  Memory lessons: $(ls memory/lessons/*.md 2>/dev/null | wc -l)"
echo "  Memory preferences: $(ls memory/preferences/*.md 2>/dev/null | wc -l)"
echo "  Notes: $(ls notes/*.md 2>/dev/null | wc -l)"
echo "  Scripts: $(ls scripts/*.sh 2>/dev/null | wc -l)"
echo "  Projects: $(ls projects/*.md 2>/dev/null | wc -l)"
echo ""

# Disk usage
echo "💾 DISK USAGE"
echo "────────────"
echo "  Total: $(du -sh . --exclude=.git 2>/dev/null | cut -f1)"
echo "  Memory: $(du -sh memory/ 2>/dev/null | cut -f1)"
echo "  Notes: $(du -sh notes/ 2>/dev/null | cut -f1)"
echo "  Scripts: $(du -sh scripts/ 2>/dev/null | cut -f1)"
echo "  Projects: $(du -sh projects/ 2>/dev/null | cut -f1)"
echo "  Git: $(du -sh .git 2>/dev/null | cut -f1)"
echo ""

# Credentials
echo "🔐 CREDENTIALS"
echo "──────────────"
[ -f ".openclaw/github-token.txt" ] && echo "  GitHub token: ✅" || echo "  GitHub token: ❌"
[ -f ".openclaw/hivemind-credentials.json" ] && echo "  Hivemind creds: ✅" || echo "  Hivemind creds: ❌"
echo ""

# Today's activity
echo "📊 TODAY'S ACTIVITY"
echo "──────────────────"
TODAY=$(date '+%Y-%m-%d')
TODAY_LOG="memory/$TODAY.md"
if [ -f "$TODAY_LOG" ]; then
    LINES=$(wc -l < "$TODAY_LOG")
    echo "  Daily log: ✅ ($LINES lines)"
else
    echo "  Daily log: ❌ (not created yet)"
fi
echo ""

echo "=================================="
echo "⚡ Kael is operational"
