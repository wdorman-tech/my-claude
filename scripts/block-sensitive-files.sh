#!/bin/bash
# Block edits to sensitive files (.env, credentials, secrets, lock files)

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE" ]; then
  exit 0
fi

# Block .env files
if [[ "$FILE" =~ \.env(\..*)?$ ]]; then
  echo "BLOCKED: Cannot edit .env files. Use env vars through your deployment platform." >&2
  exit 2
fi

# Block credential/secret files
if [[ "$FILE" =~ (credentials|secrets|service.account)\.(json|yaml|yml)$ ]]; then
  echo "BLOCKED: Cannot edit credential files." >&2
  exit 2
fi

# Block lock files
if [[ "$FILE" =~ (package-lock\.json|pnpm-lock\.yaml|yarn\.lock|poetry\.lock|uv\.lock)$ ]]; then
  echo "BLOCKED: Lock files should only change via package manager." >&2
  exit 2
fi

exit 0
