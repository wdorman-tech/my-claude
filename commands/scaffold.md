---
description: Scaffold a new project with your preferred stack. Usage: /scaffold [project-name] [type]
argument-hint: [project-name] [nextjs|python-api|script]
---

## Arguments
$ARGUMENTS

## Your task
Scaffold a new project based on the type specified.

### Available templates

**nextjs** (default if no type given):
- Next.js App Router with TypeScript strict mode
- pnpm for package management
- Supabase client setup (with env var placeholders)
- Tailwind CSS
- Biome for linting/formatting
- Basic project structure: `app/`, `lib/`, `components/`, `types/`
- `.env.example` with Supabase URL and anon key placeholders
- CLAUDE.md with project-specific context
- `.gitignore` covering node_modules, .env, .next, etc.

**python-api**:
- FastAPI with uvicorn
- uv for package management (pyproject.toml)
- Supabase Python client setup
- ruff for linting/formatting
- Basic structure: `app/`, `app/routers/`, `app/models/`, `app/services/`
- `.env.example` with Supabase and API key placeholders
- pytest setup with conftest.py
- CLAUDE.md with project-specific context

**script**:
- Single Python script with argparse
- uv for dependencies (pyproject.toml)
- ruff config
- Basic README with usage

### Process
1. Create the project directory using the project name
2. Generate all files for the chosen template
3. Initialize git and create initial commit
4. Print a summary of what was created and how to get started
