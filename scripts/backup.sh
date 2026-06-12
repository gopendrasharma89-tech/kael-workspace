#!/bin/bash
# ⚡ Kael Auto-Backup Script
# Commits all changes and pushes to GitHub
# Usage: bash scripts/backup.sh ["optional commit message"]

cd /root/.openclaw/workspace

git add -A

if git diff --cached --quiet; then
    echo "No changes to backup."
    exit 0
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
MSG="${1:-🔄 Auto-backup: $TIMESTAMP}"

git commit -m "$MSG" --quiet

if git push origin main --quiet 2>&1; then
    echo "✅ Backup pushed at $TIMESTAMP"
else
    echo "❌ Push failed — will retry on next backup"
fi
