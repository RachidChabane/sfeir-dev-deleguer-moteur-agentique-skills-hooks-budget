#!/usr/bin/env bash
# Resume a conversation within what is left of its budget.
remaining=$(echo "$CONVERSATION_BUDGET - $LAST_TOTAL_COST - $HEADROOM" | bc)
if [ "$(echo "$remaining <= 0" | bc)" -eq 1 ]; then
  echo "budget spent: the conversation stops here" >&2
  exit 1
fi

claude -p "$USER_MESSAGE" --resume "$SESSION_ID" \
  --max-turns 30 --max-budget-usd "$remaining" --output-format json > result.json &
child=$!
trap 'kill -INT "$child"; wait "$child"' TERM
wait "$child"

jq -r '.total_cost_usd' result.json   # the next LAST_TOTAL_COST
