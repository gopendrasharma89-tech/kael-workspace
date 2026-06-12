#!/bin/bash
# ⚡ Memory Consolidation
# Review daily logs and suggest items for MEMORY.md
# Run weekly via heartbeat or manually

cd /root/.openclaw/workspace

echo "⚡ Memory Consolidation Report"
echo "════════════════════════════════════════"
echo ""

# Find logs from the past 7 days
echo "📋 Logs from the past 7 days:"
for i in $(seq 0 6); do
    DATE=$(date -d "-$i days" '+%Y-%m-%d' 2>/dev/null || date -v-${i}d '+%Y-%m-%d' 2>/dev/null)
    if [ -f "memory/$DATE.md" ]; then
        LINES=$(wc -l < "memory/$DATE.md")
        echo "   ✅ $DATE ($LINES lines)"
    else
        echo "   ⬜ $DATE (no log)"
    fi
done

echo ""
echo "📌 Current Standing Reminders in MEMORY.md:"
grep -A 20 "Standing Reminders" MEMORY.md 2>/dev/null | grep "^-" | sed 's/^/   /' || echo "   (none found)"

echo ""
echo "👥 People Tracked:"
ls memory/people/ 2>/dev/null | sed 's/\.md$//' | sed 's/^/   /' || echo "   (none)"

echo ""
echo "📂 Projects:"
ls memory/projects/ 2>/dev/null | sed 's/\.md$//' | sed 's/^/   /' || echo "   (none)"

echo ""
echo "💡 Suggestions:"
echo "   - Review daily logs for items to move to MEMORY.md"
echo "   - Update memory/people/ with new context"
echo "   - Archive completed projects"
echo "   - Remove stale entries from MEMORY.md"

echo ""
echo "════════════════════════════════════════"
