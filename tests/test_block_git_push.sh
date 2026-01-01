#!/usr/bin/env bash
# The hook refuses git push with exit code 2 and lets any other command through.
set -u
hook="$(dirname "$0")/../hooks/block-git-push.sh"
echo '{"tool_name":"Bash","tool_input":{"command":"git push origin HEAD"}}' | "$hook" 2> /dev/null
[ $? -eq 2 ] || { echo "FAIL: git push was not refused"; exit 1; }
echo '{"tool_name":"Bash","tool_input":{"command":"git status"}}' | "$hook" || { echo "FAIL: git status was refused"; exit 1; }
echo "ok: git push refused, git status allowed"
