#!/bin/bash
# Check if ~/.claude git repo is out of sync with remote

CLAUDE_DIR="$HOME/.claude"

# Exit silently if not a git repo
if [ ! -d "$CLAUDE_DIR/.git" ]; then
  exit 0
fi

cd "$CLAUDE_DIR" || exit 0

# Check if remote is configured
if ! git remote get-url origin &>/dev/null; then
  echo "[claude-config] No remote configured for ~/.claude repo. Run: cd ~/.claude && git remote add origin <url>"
  exit 0
fi

# Fetch latest from remote (silent, with timeout)
git fetch origin --quiet 2>/dev/null

LOCAL=$(git rev-parse HEAD 2>/dev/null)
REMOTE=$(git rev-parse origin/main 2>/dev/null || git rev-parse origin/master 2>/dev/null)

if [ -z "$REMOTE" ]; then
  echo "[claude-config] Could not reach remote. Skipping sync check."
  exit 0
fi

# Check for uncommitted local changes
LOCAL_CHANGES=$(git status --porcelain 2>/dev/null)

# Check if local is behind remote
BEHIND=$(git rev-list --count HEAD..origin/main 2>/dev/null || git rev-list --count HEAD..origin/master 2>/dev/null)
AHEAD=$(git rev-list --count origin/main..HEAD 2>/dev/null || git rev-list --count origin/master..HEAD 2>/dev/null)

if [ "$BEHIND" -gt 0 ] 2>/dev/null || [ -n "$LOCAL_CHANGES" ] || [ "$AHEAD" -gt 0 ] 2>/dev/null; then
  echo "[claude-config] Your ~/.claude config repo is out of sync:"
  if [ "$BEHIND" -gt 0 ] 2>/dev/null; then
    echo "  - $BEHIND commit(s) BEHIND remote (remote has newer config)"
  fi
  if [ "$AHEAD" -gt 0 ] 2>/dev/null; then
    echo "  - $AHEAD commit(s) AHEAD of remote (local changes not pushed)"
  fi
  if [ -n "$LOCAL_CHANGES" ]; then
    echo "  - Uncommitted local changes:"
    echo "$LOCAL_CHANGES" | sed 's/^/      /'
  fi
  echo ""
  echo "Ask the user if they want to pull, push, or skip syncing their Claude config."
fi
