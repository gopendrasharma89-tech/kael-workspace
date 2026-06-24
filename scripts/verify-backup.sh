#!/bin/bash
# Backup Verification — Check if backup is working properly

cd /home/work/.openclaw/workspace 2>/dev/null || { echo "❌ Workspace not found"; exit 1; }

echo "🔍 Backup Verification"
echo "======================"
echo ""

# Check git status
echo "📦 Git Status:"
BRANCH=$(git branch --show-current 2>/dev/null)
if [ -z "$BRANCH" ]; then
    echo "  ❌ Not a git repo"
    exit 1
fi
echo "  Branch: $BRANCH"

# Check remote
REMOTE=$(git remote get-url origin 2>/dev/null)
if [ -z "$REMOTE" ]; then
    echo "  ❌ No remote configured"
else
    echo "  Remote: $(echo $REMOTE | sed 's|.*@||' | sed 's|\.git$||')"
fi

# Check uncommitted changes
CHANGES=$(git status --short 2>/dev/null | wc -l)
if [ "$CHANGES" -gt 0 ]; then
    echo "  ⚠️  Uncommitted changes: $CHANGES"
else
    echo "  ✅ Clean working tree"
fi

# Check last commit
LAST=$(git log -1 --format="%ar" 2>/dev/null)
echo "  Last commit: $LAST"

# Check if we can push
echo ""
echo "🔄 Testing push..."
if git push --dry-run origin main 2>/dev/null; then
    echo "  ✅ Push would succeed"
else
    echo "  ❌ Push would fail (check token/permissions)"
fi

# Check GitHub connectivity
echo ""
echo "🌐 GitHub Connectivity:"
if curl -s -o /dev/null -w "%{http_code}" https://api.github.com | grep -q "200"; then
    echo "  ✅ GitHub API accessible"
else
    echo "  ❌ GitHub API not accessible"
fi

# Check token validity
echo ""
echo "🔐 Token Check:"
if [ -f ".openclaw/github-token.txt" ]; then
    TOKEN=$(cat .openclaw/github-token.txt | tr -d '\n')
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $TOKEN" https://api.github.com/user)
    if [ "$HTTP_CODE" = "200" ]; then
        echo "  ✅ Token valid"
    else
        echo "  ❌ Token invalid (HTTP $HTTP_CODE)"
    fi
else
    echo "  ❌ Token file not found"
fi

echo ""
echo "======================"
echo "Verification complete"
