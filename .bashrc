# Change default editor to Neovim
export EDITOR="nvim"

# Disable closing terminal when pressing C-d
set -o ignoreeof

# Enable vi keybinds in terminal and replicate vi cursor style
# (I don't actually use this anymore)
# set -o vi
# bind 'set show-mode-in-prompt on'
# bind 'set vi-ins-mode-string \1\e[6 q\2'
# bind 'set vi-cmd-mode-string \1\e[2 q\2'


# {{ Tools }}

# Smarter cd based on frequency and recency
eval "$(zoxide init --cmd cd bash)"

# Terminal fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


## {{ Functions }}

# Fuzzy find files using fzf, preview with bat, open in nvim or exit
fo() {
    local selected_file
    selected_file=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" --bind "enter:execute(nvim {} > /dev/tty)")

    # If Escape is pressed, just end the command
    if [[ -n "$selected_file" ]]; then
        nvim "$selected_file"
    fi
}


# {{ Aliases }}
alias v="nvim"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gd="git diff"
alias gp="git push"
alias gpf="git push -f"
alias gl="git log"

# Checkout branch with fuzzy finding search
alias gbc="git branch --sort=committerdate | fzf | xargs git checkout"
