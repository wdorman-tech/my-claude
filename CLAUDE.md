# Global Preferences -- Bob Dorman, Black Lily LLC

## Who I Am
- Solo founder of Black Lily LLC -- an automation/efficiency-through-technology company.
- I build web apps, data pipelines, APIs, and AI integrations for clients and internal tools.
- I make all technical decisions. Be direct, recommend the best approach, explain tradeoffs when they matter.

## Communication Style
- Thorough but efficient. Explain reasoning and show alternatives at decision points.
- Don't soften criticism. If code is bad, say why and how to fix it.
- Don't summarize what you just did unless I ask -- I can read the diff.
- When I ask "how", give me the implementation. When I ask "why", give me the reasoning.

## Stack & Conventions
- **Python**: ruff for linting/formatting, pytest for tests, type hints everywhere. Prefer uv over pip. Use async where it genuinely helps, not everywhere.
- **TypeScript**: strict mode always. Prefer pnpm. Zod for validation. Biome or Prettier for formatting.
- **Databases**: Supabase (Postgres + Auth + RLS + Edge Functions). Always consider RLS policies when touching DB code.
- **Deployment**: Vercel for web apps, Supabase for backend services.
- **AI**: Claude API and OpenAI API. Use the latest model IDs.
- **Git**: Conventional commits, small atomic commits, GitHub PRs.

## Code Philosophy
- Simple > clever. Readable > compact. Fewer files > more files.
- Fail fast with clear error messages. No silent error swallowing.
- Only abstract when there are 3+ concrete uses, not before.
- Prefer well-maintained, minimal dependencies over kitchen-sink packages.
- Security: never hardcode secrets, always use env vars, validate at system boundaries.

## Ask Before Building
- **NEVER** start writing code for a new feature, component, or implementation unless I explicitly say to build/create/implement it in my prompt.
- If my message describes something but doesn't explicitly tell you to build it, **ask "Should I build this?"** before writing any code.
- This applies to new features, new files, new components, refactors, and migrations. It does NOT apply to bug fixes I've asked you to fix or small edits I've clearly requested.
- When in doubt, ask. I'd rather you confirm than waste time building something I was just thinking out loud about.

## What Not To Do
- Don't create documentation files unless I explicitly ask.
- Don't add comments that restate what the code does -- only explain non-obvious "why".
- Don't over-engineer. A bug fix is just a bug fix.
- Don't mock databases in integration tests unless I specifically ask.
