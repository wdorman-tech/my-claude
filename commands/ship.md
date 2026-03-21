---
description: Commit, push, and create a PR in one command. Usage: /ship [optional PR title]
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git log:*), Bash(git push:*), Bash(git checkout:*), Bash(git branch:*), Bash(gh pr create:*), Bash(gh pr view:*)
---

## Context
- Current status: !`git status --short`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`
- Diff from main: !`git diff main...HEAD --stat 2>/dev/null || echo "No diff from main"`
- Arguments: $ARGUMENTS

## Your task
Ship the current work: commit, push, and open a PR.

### Step 1: Branch
- If on `main`, create a descriptive feature branch and switch to it
- If already on a feature branch, stay on it

### Step 2: Commit
- Stage relevant files (specific filenames, NOT `git add .`)
- Do NOT stage .env, credentials, or binaries
- Write a conventional commit message (`type(scope): description`)
- If there are already commits on this branch and no new changes, skip this step

### Step 3: Push
- Push the branch with `-u origin`

### Step 4: PR
- Create a PR using `gh pr create`
- If `$ARGUMENTS` is provided, use it as the PR title
- Otherwise, generate a clear title from the commits
- PR body format:
  ```
  ## Summary
  - bullet points of what changed and why

  ## Test plan
  - [ ] how to verify this works
  ```
- If a PR already exists for this branch, show its URL instead of creating a duplicate

Return the PR URL when done.
