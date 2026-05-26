# tms

A tmux session picker for git worktrees. One session per worktree, opened in an fzf popup.

## What it does

Run `tms` (or hit `Ctrl+Space` inside tmux) to get a fuzzy-searchable list of every worktree across every repo in `~/projects`. Pick one to attach; if no session exists for it, `tms` creates one with three windows: `nvim`, `term`, and `claude`.

## Capabilities

- Lists existing worktrees plus local and `origin/*` branch candidates that don't have a worktree yet.
- Shows session state at a glance: ● attached, ○ detached, ◌ no session.
- Type `<repo>/<branch>` to create a new worktree on the fly (under `~/worktrees/<repo>/<branch>`). Local branches are checked out; remote-only branches are branched from `origin/<branch>`; unknown names create a fresh branch.
- Switches clients when already inside tmux, otherwise attaches.

## Layout

- `~/projects/<repo>` — main checkouts
- `~/worktrees/<repo>/<branch>` — feature worktrees

## Requirements

- `tmux`, `git`, `fzf` on `PATH`
- `~/projects` exists

## macOS setup

Disable `Ctrl+Space` in **System Settings → Keyboard → Keyboard Shortcuts → Input Sources** (it defaults to "Select the previous input source"). Otherwise macOS swallows the keybind before tmux sees it.
