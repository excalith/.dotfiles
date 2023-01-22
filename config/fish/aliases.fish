# Dotfiles
alias dotfiles="bash ~/.dotfiles/bin/dotfiles/main.sh"

# Clear terminal
alias c="clear"

# Command replacements
alias exa='command exa --group-directories-first -laFh --grid --git --icons'
alias cat=bat
alias man=batman
alias vim=nvim .
alias lg=lazygit
alias matrix='cmatrix -aBf'
alias ping=pping
alias fast='fast -u --single-line'

# History
alias h="history -15"    # last 10 history commands
alias hc="history -c"    # clear history
alias hg="history | rg " # +command

# SSH Public Keys
alias sshpubkey="pbcopy < ~/.ssh/id_ed25519.pub | echo 'SSH Public Key copied to pasteboard.'"

# IP addresses
alias pubip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Update Neovim NVChad
alias nvupdate="nvim -c \"NvChadUpdate\""

# Custom Folders
alias projects="cd ~/Projects"
alias config ="cd ~/.config"

# Custom Functions
alias sreload=". ~/.config/fish/config.fish"
alias gi="sh ~/.dotfiles/Generic/custom/gitignore/gi.zsh"
