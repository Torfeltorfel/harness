#!/usr/bin/env bash
# PreToolUse hook for Read/Edit/Write: keeps Claude out of .env files with real secrets.
# .env.example, .env.sample and .env.template stay allowed.
command -v jq >/dev/null || { echo "protect-env: jq not found, check skipped" >&2; exit 1; }

path=$(jq -r '.tool_input.file_path // empty')
name=$(basename "$path")

case "$name" in
  .env.example|.env.sample|.env.template) exit 0 ;;
  .env|.env.*)
    echo "Blocked by protect-env: $name may hold secrets. Ask the user for the values you need, or use .env.example." >&2
    exit 2 ;;
esac
exit 0
