#!/usr/bin/env bash
# PreToolUse hook for Bash: blocks commands that are hard to undo.
# Exit 2 blocks the call and shows stderr to Claude.
command -v jq >/dev/null || { echo "guard-bash: jq not found, check skipped" >&2; exit 1; }

cmd=$(jq -r '.tool_input.command // empty')
[ -z "$cmd" ] && exit 0

block() { echo "Blocked by guard-bash: $1. Ask the user to run it themselves if it's really intended." >&2; exit 2; }

# rm -r on root, home or parent directories
if echo "$cmd" | grep -Eq '(^|[;&|[:space:]])rm[[:space:]]+(-[a-zA-Z]*[rR][a-zA-Z]*[[:space:]]+)+(-[a-zA-Z]+[[:space:]]+)*("?(/|/\*|~|~/|~/\*|\$HOME|\$HOME/|\$HOME/\*|\.\.|\.\./?\*?)"?)([[:space:]]|$)'; then
  block "recursive rm on /, ~, \$HOME or .."
fi

# Force-push to main/master, or force-push while on main/master
if echo "$cmd" | grep -Eq 'git[[:space:]]+push\b.*(--force|--force-with-lease|[[:space:]]-[a-zA-Z]*f)'; then
  if echo "$cmd" | grep -Eq '(^|[[:space:]:+])(main|master)([[:space:]]|$)'; then
    block "force-push to main/master"
  fi
  branch=$(git -C "${CLAUDE_PROJECT_DIR:-.}" branch --show-current 2>/dev/null)
  if [ "$branch" = main ] || [ "$branch" = master ]; then
    block "force-push while on $branch"
  fi
fi

exit 0
