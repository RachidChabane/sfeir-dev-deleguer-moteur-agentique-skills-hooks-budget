#!/usr/bin/env bash
# PreToolUse: refuse any Bash command that pushes to a Git remote.
command -v jq > /dev/null || { echo "jq is missing: command refused" >&2; exit 2; }
command=$(jq -r '.tool_input.command // empty')
if printf '%s' "$command" | grep -Eq '(^|[;&|[:space:]])git[[:space:]]+push'; then
  echo "git push is refused here: the application publishes the branch itself." >&2
  exit 2
fi
exit 0
