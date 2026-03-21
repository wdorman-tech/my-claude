---
description: Stage and commit changes with a conventional commit message
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git log:*)
---

## Context
- Current status: !`git status --short`
- Staged diff: !`git diff --cached --stat`
- Unstaged diff: !`git diff --stat`
- Recent commits: !`git log --oneline -5`
- Current branch: !`git branch --show-current`

## Your task
Create a single git commit for the current changes.

1. Review the status and diffs above
2. Stage the relevant changed files (use specific filenames, NOT `git add .` or `git add -A`)
3. Do NOT stage .env files, credentials, or large binary files
4. Write a conventional commit message:
   - Format: `type(scope): description`
   - Types: feat, fix, refactor, docs, test, chore, style, perf
   - Keep the first line under 72 characters
   - Add a body only if the "why" isn't obvious from the description
5. Create the commit

If there are no changes to commit, say so.
