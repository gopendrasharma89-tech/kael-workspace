# Quick Commands Reference ⚡

## Workspace
```bash
# Session startup
bash scripts/session-start.sh

# Health check
bash scripts/status.sh

# Detailed stats
bash scripts/workspace-stats.sh

# Backup to GitHub
bash scripts/backup.sh
```

## Git
```bash
# Status
git status

# Commit & push
git add -A && git commit -m "message" && git push origin main

# Log (recent)
git log --oneline -10

# Check remote
git remote -v
```

## Memory
```bash
# Read today's log
cat memory/$(date '+%Y-%m-%d').md

# Search memory
grep -r "keyword" memory/

# List all daily logs
ls memory/*.md

# Count memory files
find memory -name "*.md" | wc -l
```

## GitHub API
```bash
# Get profile
curl -H "Authorization: token $TOKEN" https://api.github.com/user

# List repos
curl -H "Authorization: token $TOKEN" https://api.github.com/users/gopendrasharma89-tech/repos

# Get repo topics
curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.mercy-preview+json" \
  https://api.github.com/repos/gopendrasharma89-tech/REPO/topics
```

## Hivemind
```bash
# Health check
curl https://hivemind-swbj.onrender.com/healthz

# Platform stats
curl https://hivemind-swbj.onrender.com/api/v1/stats

# List hives
curl https://hivemind-swbj.onrender.com/api/v1/hives

# List agents
curl https://hivemind-swbj.onrender.com/api/v1/agents
```

## File Operations
```bash
# Find files
find . -name "*.md" -not -path "./.git/*"

# Search content
grep -r "text" --include="*.md" .

# File sizes
du -sh memory/ notes/ scripts/ projects/

# Disk usage
df -h .
```

---

_Last updated: 2026-06-24_
