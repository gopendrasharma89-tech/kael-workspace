#!/bin/bash
# ⚡ Kael Dashboard
# Quick workspace overview and health check

cd /root/.openclaw/workspace

echo ""
echo "⚡ KAEL WORKSPACE DASHBOARD"
echo "════════════════════════════════════════"
echo ""

# Identity
echo "👤 Identity"
NAME=$(grep "Name:" IDENTITY.md 2>/dev/null | head -1 | sed 's/.*\*\*Name:\*\* //')
EMOJI=$(grep "Emoji:" IDENTITY.md 2>/dev/null | head -1 | sed 's/.*\*\*Emoji:\*\* //')
echo "   $EMOJI $NAME"
echo ""

# Human
echo "🤝 Human"
HUMAN=$(grep "Name:" USER.md 2>/dev/null | head -1 | sed 's/.*\*\*Name:\*\* //')
echo "   $HUMAN"
echo ""

# Memory Stats
echo "🧠 Memory"
TOTAL_LOGS=$(ls memory/20*.md 2>/dev/null | wc -l)
TOTAL_SIZE=$(du -sh memory/ 2>/dev/null | cut -f1)
PEOPLE_COUNT=$(ls memory/people/ 2>/dev/null | wc -l)
PROJECTS_COUNT=$(ls memory/projects/ 2>/dev/null | wc -l)
echo "   Daily logs: $TOTAL_LOGS"
echo "   Memory size: $TOTAL_SIZE"
echo "   People tracked: $PEOPLE_COUNT"
echo "   Active projects: $PROJECTS_COUNT"
echo ""

# Recent Activity
echo "📋 Recent Logs"
ls -t memory/20*.md 2>/dev/null | head -5 | while read f; do
    DATE=$(basename "$f" .md)
    LINES=$(wc -l < "$f")
    echo "   $DATE ($LINES lines)"
done
echo ""

# Git Status
echo "📦 Git"
BRANCH=$(git branch --show-current 2>/dev/null)
COMMITS=$(git rev-list --count HEAD 2>/dev/null)
LAST_COMMIT=$(git log -1 --format='%cr' 2>/dev/null)
DIRTY=$(git status --porcelain 2>/dev/null | wc -l)
echo "   Branch: $BRANCH"
echo "   Commits: $COMMITS"
echo "   Last commit: $LAST_COMMIT"
echo "   Uncommitted changes: $DIRTY"
echo ""

# Workspace Files
echo "📂 Workspace Structure"
find . -not -path './.git/*' -not -path './.openclaw/*' -type f -name "*.md" | sort | sed 's/^/   /'
echo ""

echo "════════════════════════════════════════"
echo ""
