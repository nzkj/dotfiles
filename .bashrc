alias v="nvim"

# Change default editor to Neovim (instead of NANO)
export EDITOR="nvim"

# Enable vi keybinds in terminal and replicate vi cursor style
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'
