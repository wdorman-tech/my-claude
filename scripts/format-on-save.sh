#!/bin/bash
# Auto-format files after Claude writes/edits them
# Reads tool input from stdin, formats the file based on extension

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  exit 0
fi

case "$FILE" in
  *.py)
    if command -v ruff &>/dev/null; then
      ruff check --fix --quiet "$FILE" 2>/dev/null
      ruff format --quiet "$FILE" 2>/dev/null
    fi
    ;;
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css)
    if command -v npx &>/dev/null; then
      npx prettier --write "$FILE" 2>/dev/null
    fi
    ;;
esac

exit 0
