#!/bin/bash
# Kael Workspace Status — Quick health check

cd /home/work/.openclaw/workspace 2>/dev/null || { echo "❌ Workspace not found"; exit 1; }

echo "⚡ Kael Workspace Status"
echo "========================"
echo ""

# Git status
echo "📦 Git:"
BRANCH=$(git branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then
    CHANGES=$(git status --short 2>/dev/null | wc -l)
    LAST_COMMIT=$(git log -1 --format="%ar" 2>/dev/null)
    REMOTE=$(git remote get-url origin 2>/dev/null | sed 's|.*@||' | sed 's|\.git$||')
    echo "  Branch: $BRANCH"
    echo "  Uncommitted changes: $CHANGES"
    echo "  Last commit: $LAST_COMMIT"
    echo "  Remote: $REMOTE"
else
    echo "  ⚠️ Not a git repo"
fi

echo ""

# Memory files
echo "🧠 Memory:"
TODAY=$(date '+%Y-%m-%d')
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d' 2>/dev/null)
[ -f "memory/$TODAY.md" ] && echo "  Today's log: ✅ ($TODAY)" || echo "  Today's log: ❌ (missing)"
[ -f "memory/$YESTERDAY.md" ] && echo "  Yesterday's log: ✅ ($YESTERDAY)" || echo "  Yesterday's log: ❌ (missing)"
echo "  People files: $(ls memory/people/*.md 2>/dev/null | wc -l)"
echo "  Project files: $(ls memory/projects/*.md 2>/dev/null | wc -l)"
echo "  Total daily logs: $(ls memory/*.md 2>/dev/null | wc -l)"

echo ""

# Disk usage
echo "💾 Disk:"
echo "  Workspace: $(du -sh . 2>/dev/null | cut -f1)"
echo "  Memory: $(du -sh memory/ 2>/dev/null | cut -f1)"
echo "  Projects: $(du -sh projects/ 2>/dev/null | cut -f1)"

echo ""

# Key files check
echo "📋 Core Files:"
for f in IDENTITY.md USER.md SOUL.md MEMORY.md AGENTS.md TOOLS.md HEARTBEAT.md; do
    [ -f "$f" ] && echo "  $f: ✅" || echo "  $f: ❌ MISSING"
done

echo ""

# Credentials check
echo "🔐 Credentials:"
[ -f ".openclaw/github-token.txt" ] && echo "  GitHub token: ✅" || echo "  GitHub token: ❌"
[ -f ".openclaw/hivemind-credentials.json" ] && echo "  Hivemind creds: ✅" || echo "  Hivemind creds: ❌"

echo ""
echo "Last checked: $(date '+%Y-%m-%d %H:%M:%S %Z')"
