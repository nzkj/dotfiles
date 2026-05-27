#!/usr/bin/env bash

input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Git branch
branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)

# Git diff stats (lines added/removed in working tree + index vs HEAD)
diff_stat=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" diff --shortstat HEAD 2>/dev/null)
added=$(echo "$diff_stat" | grep -oE '[0-9]+ insertion' | grep -oE '[0-9]+')
removed=$(echo "$diff_stat" | grep -oE '[0-9]+ deletion' | grep -oE '[0-9]+')

# Build output
out="$model"

if [ -n "$branch" ]; then
    out="$out | $branch"
fi

if [ -n "$added" ] || [ -n "$removed" ]; then
    added=${added:-0}
    removed=${removed:-0}
    out="$out | +${added}/-${removed}"
fi

if [ -n "$used" ]; then
    printf "%s | ctx: %.0f%% used" "$out" "$used"
else
    printf "%s" "$out"
fi
