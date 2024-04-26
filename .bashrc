# Aliases
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
alias wompwomp="gdb"

# Change default editor to Neovim (instead of NANO)
export EDITOR="nvim"

# Disable closing terminal when pressing C-d
set -o ignoreeof

# Enable vi keybinds in terminal and replicate vi cursor style
# (I don't actually use this anymore)
# set -o vi
# bind 'set show-mode-in-prompt on'
# bind 'set vi-ins-mode-string \1\e[6 q\2'
# bind 'set vi-cmd-mode-string \1\e[2 q\2'

# Smarter cd
eval "$(zoxide init --cmd cd bash)"

# Terminal fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
