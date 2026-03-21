---
description: Review current changes or a specific file for issues. Usage: /review [optional file or PR number]
allowed-tools: Bash(git diff:*), Bash(git log:*), Bash(gh pr diff:*), Bash(gh pr view:*)
---

## Context
- Current branch: !`git branch --show-current`
- Uncommitted changes: !`git diff --stat`
- Staged changes: !`git diff --cached --stat`
- Arguments: $ARGUMENTS

## Your task
Perform a thorough code review.

### What to review
- If `$ARGUMENTS` is a number, treat it as a GitHub PR number -- fetch and review that PR's diff
- If `$ARGUMENTS` is a file path, review that specific file
- If no arguments, review all uncommitted + staged changes

### Launch the code-reviewer agent to do the actual review.

### After the review
Summarize: total issues found by severity (critical/major/minor), and the top 3 most important things to fix.
