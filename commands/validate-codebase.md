---
description: Analyze a codebase's goal, confirm with user, then test it works. Usage: /validate-codebase [path-to-codebase]
argument-hint: [path-to-codebase]
allowed-tools: Bash(git:*), Bash(node:*), Bash(npx:*), Bash(pnpm:*), Bash(npm:*), Bash(python:*), Bash(uv:*), Bash(pytest:*), Bash(ruff:*), Bash(pip:*), Bash(cargo:*), Bash(go:*), Bash(dotnet:*), Bash(java:*), Bash(mvn:*), Bash(gradle:*), Bash(make:*), Bash(ls:*), Bash(cat:*), Bash(mkdir:*), Bash(touch:*), Read, Glob, Grep, Agent, AskUserQuestion
---

## Arguments
$ARGUMENTS

## Your task
Validate that an existing codebase achieves its intended goal. Work through these phases in order.

### Phase 1: Locate the codebase
- If `$ARGUMENTS` is provided, use it as the codebase path
- If no arguments, ask the user for the path
- Verify the path exists and contains code

### Phase 2: Discover the codebase's goal
Use the Explore agent to thoroughly analyze the codebase:
- Read the README, CLAUDE.md, package.json, pyproject.toml, Cargo.toml, or any manifest files
- Scan the main entry points and key source files
- Look at the project structure, route definitions, CLI args, exports
- Check git history for context on what the project does
- Identify the tech stack (language, framework, dependencies)

Synthesize a clear, specific statement of **what this codebase is supposed to do** -- its primary goal and any secondary goals.

### Phase 3: Confirm the goal with the user
Present your findings:
```
Codebase: [name]
Path: [path]
Stack: [language/framework/key deps]

Primary goal: [what the codebase is meant to accomplish]
Secondary goals: [any additional functionality]
```

Ask the user: **"Is this correct? Adjust anything before I test?"**

Do NOT proceed to Phase 4 until the user confirms. If they correct you, update your understanding and re-confirm.

### Phase 4: Test the codebase
Create a `logs/` directory inside the codebase root if it doesn't exist. All logs go there.

Generate a timestamped log file: `logs/validate-YYYY-MM-DD-HHmmss.log`

Run these checks (skip any that don't apply to the detected stack):

1. **Dependency check** -- Are all dependencies installable? Log the result.
2. **Build check** -- Does the project build/compile without errors?
3. **Lint check** -- Run the project's linter if configured (ruff, biome, eslint, etc.)
4. **Existing tests** -- Run any test suite found (pytest, jest, vitest, cargo test, go test, etc.)
5. **Entry point check** -- Can the main entry point be invoked without crashing? (e.g., `--help` flag, dry run, import check)
6. **Goal-specific validation** -- Based on the confirmed goal, design and run 1-3 targeted checks:
   - For an API: can it start and respond to a health check?
   - For a CLI tool: does the main command produce expected output?
   - For a library: can its primary exports be imported and called?
   - For a web app: does it build and serve?
   - For a data pipeline: can it run on sample/test data?

For each check, log:
```
[TIMESTAMP] [PASS/FAIL/SKIP] Check name
  Command: what was run
  Output: stdout/stderr (truncated if very long)
  Notes: any relevant context
```

### Phase 5: Report results
Write a summary section at the top of the log file:
```
=== Validation Summary ===
Codebase: [name]
Goal: [confirmed goal]
Date: [timestamp]
Result: [PASS/PARTIAL/FAIL]

[PASS/FAIL/SKIP] Dependency check
[PASS/FAIL/SKIP] Build check
[PASS/FAIL/SKIP] Lint check
[PASS/FAIL/SKIP] Existing tests (X passed, Y failed)
[PASS/FAIL/SKIP] Entry point check
[PASS/FAIL/SKIP] Goal validation: [description]

Issues found: [count]
=== Details below ===
```

Present the summary to the user. If anything failed, explain what went wrong and suggest fixes.
