#!/bin/bash
# Kael Workspace Auto-Backup
# Commits and pushes all changes to GitHub

set -e

WORKSPACE="/home/work/.openclaw/workspace"
cd "$WORKSPACE"

# Read token
GH_TOKEN=$(cat .openclaw/github-token.txt 2>/dev/null | tr -d '\n')
if [ -z "$GH_TOKEN" ]; then
    echo "❌ No GitHub token found in .openclaw/github-token.txt"
    exit 1
fi

# Set remote with token
git remote set-url origin "https://${GH_TOKEN}@github.com/gopendrasharma89-tech/kael-workspace.git" 2>/dev/null || true

# Stage everything (respects .gitignore)
git add -A

# Check if there are changes
if git diff --cached --quiet; then
    echo "✅ No changes to backup"
    exit 0
fi

# Commit with timestamp and summary
TIMESTAMP=$(date -u '+%Y-%m-%d %H:%M:%S UTC')
CHANGED=$(git diff --cached --name-only | wc -l)
git commit -m "🔄 Auto-backup: $TIMESTAMP" -m "$CHANGED file(s) changed" 2>&1

# Push
if git push origin main 2>&1; then
    echo "✅ Backup pushed: $TIMESTAMP ($CHANGED files)"
else
    echo "❌ Push failed — will retry next cycle"
    exit 1
fi
