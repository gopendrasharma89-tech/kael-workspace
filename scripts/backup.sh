#!/bin/bash
# Kael Auto-Backup Script
# Commits all changes and pushes to GitHub
# Run after every important action

cd /home/work/.openclaw/workspace

# Stage everything
git add -A

# Check if there are changes
if git diff --cached --quiet; then
    echo "No changes to backup."
    exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "🔄 Auto-backup: $TIMESTAMP" --quiet

# Push
git push origin main --quiet 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Backup pushed at $TIMESTAMP"
else
    echo "❌ Push failed — will retry on next backup"
fi
