#!/bin/bash
# Workspace Initialization — Set up Kael's workspace from scratch

set -e

WORKSPACE="/home/work/.openclaw/workspace"
REPO="https://github.com/gopendrasharma89-tech/kael-workspace.git"

echo "⚡ Kael Workspace Initialization"
echo "================================="
echo ""

# Check if workspace exists
if [ -d "$WORKSPACE/.git" ]; then
    echo "⚠️  Workspace already exists with git"
    echo "   Pulling latest changes..."
    cd "$WORKSPACE"
    git pull origin main 2>/dev/null || echo "   Pull failed (might not have remote)"
    echo "   ✅ Updated"
    exit 0
fi

# Clone if doesn't exist
echo "📦 Cloning workspace from GitHub..."
if [ -d "$WORKSPACE" ]; then
    cd "$WORKSPACE"
    git init
    git remote add origin "$REPO" 2>/dev/null || true
    git fetch origin
    git checkout -f main
else
    git clone "$REPO" "$WORKSPACE"
    cd "$WORKSPACE"
fi

echo "✅ Workspace cloned"

# Create today's memory file
TODAY=$(date '+%Y-%m-%d')
if [ ! -f "memory/$TODAY.md" ]; then
    echo "📝 Creating today's memory file..."
    mkdir -p memory
    cat > "memory/$TODAY.md" << EOF
# $TODAY — Session Log

## Notes

EOF
fi

# Make scripts executable
chmod +x scripts/*.sh 2>/dev/null

# Run status check
echo ""
bash scripts/status.sh

echo ""
echo "⚡ Workspace ready!"
