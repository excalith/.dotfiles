# https://fishshell.com/docs/current/cmds/bind.html

# Start fzf for finding files while displaying them within bat
bind \ct 'fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

# Start fzf for fuzzy-cd into dir
bind \cd 'cd $(tree -dfia -L 1 | fzf)'