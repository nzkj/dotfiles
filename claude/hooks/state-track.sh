#!/usr/bin/env bash
# state-track.sh — track Claude's "waiting on user" state for the claudes picker.
#
# Drops/removes a marker file at ~/.claude/sessions/<sessionId>.pending when
# claude is blocked on the user (permission prompt or AskUserQuestion) so
# bin/claudes can show that session as `pending` instead of `running`.
#
# Hook input arrives on stdin as JSON:
#   { "session_id": "...", "hook_event_name": "...", "message": "...", ... }
# Dispatch: $1 = set | clear.
#
# Notification fires for BOTH permission prompts and the 60s-idle warning
# ("Claude is waiting for your input"). Only the former should count as
# pending — otherwise an idle session lingering past 60s gets stuck in
# `pending` forever, since the pruner can't clear a marker whose mtime is
# genuinely newer than the session's last status update.
#
# Always exits 0 — hooks must not break claude's main loop.

mode=$1
sessions_dir="${HOME}/.claude/sessions"

input=$(cat)
sid=$(jq -r '.session_id // empty' <<<"$input" 2>/dev/null)

[[ -z "$sid" ]] && exit 0

marker="${sessions_dir}/${sid}.pending"

case "$mode" in
    set)
        event=$(jq -r '.hook_event_name // empty' <<<"$input" 2>/dev/null)
        message=$(jq -r '.message // empty' <<<"$input" 2>/dev/null)
        if [[ "$event" == "Notification" && "$message" == *"waiting for your input"* ]]; then
            exit 0
        fi
        : > "$marker"
        ;;
    clear) rm -f "$marker" ;;
esac

exit 0
