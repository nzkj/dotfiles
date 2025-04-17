# =================== #
# == Miscellaneous == #
# =================== #

# Disable closing terminal when pressing C-d
set -o ignoreeof

# Add Neovim bin to PATH via Bob version manager
export PATH="$PATH:/home/nzkj/.local/share/bob/nvim-bin"

# Change defaults to Neovim
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# =============== #
# == Functions == #
# =============== #

# Fuzzy find files using fzf, preview with bat, open in nvim or exit
fo() {
    local selected_file
    selected_file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --bind "enter:execute(nvim {} > /dev/tty)")

    # If Escape is pressed, just end the command
    if [[ -n "$selected_file" ]]; then
        nvim "$selected_file"
    fi
}

t() {
    if ! command -v tmux &> /dev/null; then
        echo "Error: tmux is not installed."
        return 1
    fi

    if [ -n "$TMUX" ]; then
        echo "Error: don't run tmux in tmux"
        return 1
    fi

    session_name=$(basename "$(pwd)")
    if tmux has-session -t "$session_name" &> /dev/null; then
        echo "Error: session '${session_name}' already exists."
        return 1
    fi

    # Create new session with two windows
    tmux new-session -d -s $session_name
    tmux new-window
    tmux attach-session -t $session_name
}


# ============= #
# == Aliases == #
# ============= #

alias v="nvim"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gd="git diff"
alias gp="git push"
alias gpf="git push -f"
alias gl="git log"
alias gf="git fetch"
alias gsp="git stash push -m"

# Checkout branch with fuzzy finding search
alias gbc="git branch --sort=committerdate | fzf | xargs git checkout"


# =========== #
# == Tools == #
# =========== #

# Terminal fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Smarter cd based on frequency and recency
eval "$(zoxide init --cmd cd bash)"
