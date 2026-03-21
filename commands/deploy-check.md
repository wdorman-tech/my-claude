---
description: Run pre-deployment checks for Vercel/Supabase projects
allowed-tools: Bash(npx:*), Bash(pnpm:*), Bash(npm:*), Bash(node:*), Bash(python:*), Bash(uv:*), Bash(ruff:*), Bash(pytest:*), Bash(vercel:*), Bash(supabase:*)
---

## Context
- Current branch: !`git branch --show-current`
- Uncommitted changes: !`git status --short`
- Package info: !`cat package.json 2>/dev/null | head -5 || echo "No package.json"`
- Python project: !`cat pyproject.toml 2>/dev/null | head -5 || echo "No pyproject.toml"`

## Your task
Run a pre-deployment checklist and report results.

### Checks to run (skip any that don't apply to this project):

1. **Uncommitted changes** -- warn if working tree is dirty
2. **Type checking** -- `npx tsc --noEmit` for TS projects
3. **Linting** -- `npx biome check .` or `ruff check .` depending on the stack
4. **Tests** -- `pnpm test` or `pytest` depending on the stack
5. **Build** -- `pnpm build` for Next.js projects
6. **Env vars** -- check `.env.example` exists and list any vars that need to be set in Vercel/Supabase
7. **Supabase migrations** -- check if there are pending migrations (`supabase db diff` if supabase CLI is available)

### Output format
```
Pre-deploy checklist:
[PASS/FAIL] Type check
[PASS/FAIL] Lint
[PASS/FAIL] Tests (X passed, Y failed)
[PASS/FAIL] Build
[WARN/OK]   Uncommitted changes
[INFO]      Env vars to verify: LIST

Ready to deploy: YES/NO
```

If any check fails, show the error details and suggest fixes.
