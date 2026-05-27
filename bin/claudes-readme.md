# claudes

A picker for running Claude Code instances. Lists every live session, classifies its state, and switches you to its tmux pane.

## What it does

Run `claudes` (or hit `Ctrl+_` inside tmux) to get a fuzzy-searchable list of every running `claude` process across every tmux pane. Pick one and you're switched to its window. The preview shows the pane's full scrollback so you can see what each one is doing.

## Capabilities

- Shows state at a glance: `?` pending (blocked on you), `▶` running, `✓` idle, `⌧` no-tmux. Pending bubbles to the top, so a session that needs you is the first thing you see.
- Auto-refreshes once per second — sessions starting, finishing, or flipping to `pending` appear without reopening the picker.
- Preview shows the target pane's scrollback, scrolled to the bottom on focus.

## Requirements

- `tmux`, `fzf` (>= 0.41 for `--listen`), `jq`, `curl` on `PATH`
- Hooks installed so `pending` can be detected (see Setup)

## Setup on a fresh machine

1. Copy `bin/claudes` somewhere on `PATH` and `chmod +x` it.
2. Copy `claude/hooks/state-track.sh` to `~/.claude/hooks/state-track.sh` and `chmod +x` it. Without it, blocked sessions show as `running` instead of `pending`.
3. Merge the `hooks` block from `claude/settings.json` into your `~/.claude/settings.json`.
4. The tmux binding (`Ctrl+_`) is in `.tmux.conf`.
