# dotfiles

My config.

## Layout

- **`.bashrc`/`.zshrc`, `.tmux.conf`** - shell and TMUX config.
- **`nvim/`** - Neovim config (`init.lua` + `lua/` for plugins and options).
- **`bin/`** - scripts I use day-to-day. `tms` for TMUX worktree sessions, `claudes` for Claude Code session picking.
- **`claude/`** - Claude Code settings, hooks, keybindings, and statusline.
- **`macOS/`** - Mac-specific bits: Ghostty (terminal), Aerospace (window manager), and a few Library files.

## Workflow

One TMUX session per git worktree. Each session has the same windows:

1. **`nvim`** - code.
2. **`term`** - terminal stuff (git, builds, etc.).
3. **`claude`** - Claude Code.
4. **`...`** - free-for-all.

Navigate between windows using Aerospace (`Opt+<key>` to switch window/workspace).

### tms

Branch-per-worktree workflow. Main checkouts live in `~/projects/<repo>`; feature worktrees live in `~/worktrees/<repo>/<branch>`. `tms` (bound to `Ctrl+Space`) is an fzf picker over every worktree across every repo - pick one to attach, or type `<repo>/<branch>` into the prompt to spin up a new worktree and session on the fly.

```
● projects  example-project-1
○ projects  dotfiles
○ worktrees example-project-1/feature-a
◌ worktrees example-project-1/feature-b
```

`●` attached, `○` detached, `◌` no session yet.

### claudes

Same idea but for Claude Code instances. `claudes` (bound to `Opt+/`) lists every running `claude` process across all tmux panes, sorted by who's waiting on me. Pick one and you're switched to its pane.

```
? dotfiles                      pending  claude
▶ example-project-1             running  claude
✓ example-project-1/feature-a   idle     claude
```

`?` blocked on me, `▶` running, `✓` idle.
