# If you come from bash you might have to change your $PATH.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Dotfiles Path
export DOTFILES_PATH="$HOME/.dotfiles"	

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:~/.local/bin:$PATH"

# Disable Gatekeeper for homebrew
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

# Export GPG TTY
export GPG_TTY=$(tty)

# Enable mouse scroll for less
export LESS=-R
export LESS='--mouse --wheel-lines=3'
export COLUMNS=80

# Setup Bat
export BAT_PAGER="less -RF"

# Setup FASD
eval "$(fasd --init auto)"

# FZF Defaults
export FZF_DEFAULT_OPTS='--height 96% --reverse --border rounded --preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_CTRL_T_OPTS='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'

# Refresh shell config
function sreload() {
	source "$HOME/.bashrc"
    source "$HOME/.bash.local"
    source "$HOME/.config/bash/aliases.bash"
    source "$HOME/.config/bash/functions.bash"
}
export -f sreload

# Source all files
source "$HOME/.bash.local"
source "$HOME/.config/bash/aliases.bash"
source "$HOME/.config/bash/functions.bash"

# Pretty ping alias
alias ping=ping_pretty

# forgit
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"

# Source starship
eval "$(starship init bash)"
