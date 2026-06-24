#!/bin/bash
# Kael Workspace Auto-Backup
# Pushes all changes to GitHub after every run

set -e

WORKSPACE="/home/work/.openclaw/workspace"
cd "$WORKSPACE"

# Read token
GH_TOKEN=$(cat .openclaw/github-token.txt 2>/dev/null)
if [ -z "$GH_TOKEN" ]; then
  echo "❌ No GitHub token found in .openclaw/github-token.txt"
  exit 1
fi

# Set remote with token
git remote set-url origin "https://${GH_TOKEN}@github.com/gopendrasharma89-tech/kael-workspace.git" 2>/dev/null || true

# Stage everything (except .gitignore exclusions)
git add -A

# Check if there are changes
if git diff --cached --quiet; then
  echo "✅ No changes to backup"
  exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date -u '+%Y-%m-%d %H:%M:%S')
CHANGES=$(git diff --cached --stat | tail -1)
git commit -m "🔄 Auto-backup: $TIMESTAMP" -m "$CHANGES" 2>&1

# Push
git push origin main 2>&1

echo "✅ Backup pushed to GitHub: $TIMESTAMP"
