# If you come from bash you might have to change your $PATH.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

# Plugins
plugins=(git macos arasaka z sudo dirhistory history)

# Setup FASD
eval "$(fasd --init auto)"

# Setup The Fuck
eval $(thefuck --alias)

# Setup GitHub Hub
eval "$(hub alias -s)"

# Setup FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 96% --reverse --border rounded --preview "bat --style=numbers --color=always --line-range :500 {}"'

# Easy navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Reload zsh sessions
function sreload() {
    source ~/.zshrc
	source ~/.zsh.local
	source ~/.config/bash/aliases.bash
	source ~/.config/bash/functions.bash
}

# Update shell
function supdate() {
    printf "\nUpdating zsh\n"
    OS=$(uname)
    case $OS in
    Linux)
        sudo apt upgrade -qqy --fix-missing && sudo apt install --allow-unauthenticated -qqy "zsh"
        ;;
    Darwin)
        brew upgrade zsh
        ;;
    esac
}

# Include ZSH Local
source ~/.zsh.local
source ~/.config/bash/aliases.bash
source ~/.config/bash/functions.bash

# Source starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"
