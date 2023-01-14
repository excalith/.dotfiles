# Clear terminal
alias c="clear"

# Command replacements
alias exa='command exa --group-directories-first -laFh --grid --git --icons'
alias cat=bat
alias man=batman
alias vim=nvim .
alias lg=lazygit
alias matrix='cmatrix -aBf'
alias ping=ping_pretty
alias fast='fast -u --single-line'

# History
alias h="history -15"    # last 10 history commands

# SSH Public Keys
alias sshpubkey="pbcopy < ~/.ssh/id_ed25519.pub | echo 'SSH Public Key copied to pasteboard.'"

# Show time
alias ct="{print -z Current time is $(date)}"

# Update oh-my-zsh
alias supdate="omf update"

# Update Neovim NVChad
alias nvupdate="nvim -c \"NvChadUpdate\""

# CD into dir from anywhere
alias j='fasd_cd -d'

# Custom Folders
alias dotfiles="cd ~/.dotfiles"
alias projects="cd ~/Projects"
alias config ="cd ~/.config"
