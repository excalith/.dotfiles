# If you come from bash you might have to change your $PATH.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:~/.local/bin:$PATH"

# Path to your oh-my-zsh installation
export ZSH="/Users/excalith/.oh-my-zsh"

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

# ZSH Theme
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"

# Plugins
plugins=(git macos arasaka z sudo dirhistory history)

# Source zsh
source $ZSH/oh-my-zsh.sh

# Spaceship Theme Settings
SPACESHIP_DIR_COLOR="green"
SPACESHIP_GIT_PREFIX=""
SPACESHIP_CHAR_SYMBOL="λ " # Changed from ➜

# Setup FASD
eval "$(fasd --init auto)"

# Setup The Fuck
eval $(thefuck --alias)

# Setup GitHub Hub
eval "$(hub alias -s)"

# Setup FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 96% --reverse --border rounded --preview "bat --style=numbers --color=always --line-range :500 {}"'

test -e "$HOME/.shellfishrc" && source "$HOME/.shellfishrc"
