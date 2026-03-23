# my-claude

Personal Claude Code configuration for Black Lily LLC. Portable commands, agents, hooks, and helper scripts that sync across machines.

## What's in here

### Commands (`commands/`)

Slash commands invoked with `/command-name` in Claude Code.

| Command | Description |
|---------|-------------|
| `/commit` | Stage and commit with a conventional commit message |
| `/deploy-check` | Run pre-deployment checks (types, lint, tests, build, env vars) |
| `/research` | Deep-dive a domain/industry and build a reference knowledge base |
| `/review` | Code review for uncommitted changes, a file, or a GitHub PR |
| `/scaffold` | Scaffold a new project (Next.js, Python API, or script) |
| `/setup-project` | Interview-driven project setup for optimal Claude Code config |
| `/ship` | Commit, push, and create a PR in one command |
| `/validate-codebase` | Analyze a codebase's goal, confirm it, then test that it works |
| `/yn` | Quick yes/no answer with reasoning |

### Agents (`agents/`)

Specialized sub-agents that Claude Code can delegate to.

| Agent | Purpose |
|-------|---------|
| `architect` | Design feature architecture and implementation plans |
| `code-reviewer` | Review code for quality, bugs, security, and conventions |
| `debugger` | Investigate bugs, test failures, and unexpected behavior |
| `researcher` | Look up docs, libraries, APIs, and best practices |
| `security-reviewer` | Security-focused review (auth, data exposure, RLS, OWASP) |

### Scripts (`scripts/`)

Shell scripts used by hooks and automation.

| Script | Trigger | Purpose |
|--------|---------|---------|
| `block-sensitive-files.sh` | Pre-Write/Edit hook | Prevents writing to `.env`, credentials, and secret files |
| `check-config-sync.sh` | Session start | Warns if local config has drifted from the repo |
| `format-on-save.sh` | Post-Write/Edit hook | Auto-formats files after Claude edits them |
| `notify-windows.sh` | Permission/idle prompts | Windows toast notification when Claude needs attention |

### Settings (`settings.json`)

Global Claude Code settings including model preference, hooks configuration, and auto-update channel.

### CLAUDE.md

Global instructions that apply to every project -- coding standards, stack preferences, and collaboration rules.

## Setup

Clone into your Claude Code config directory:

```bash
git clone git@github.com:wdorman-tech/my-claude.git ~/.claude
```

If you already have a `~/.claude` directory, back it up first or selectively copy what you need.

## How it works

The `.gitignore` uses a whitelist approach -- it ignores everything by default, then explicitly tracks only portable configuration files. Secrets, session data, caches, and machine-local state are never committed.
