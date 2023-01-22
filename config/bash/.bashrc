# If you come from bash you might have to change your $PATH.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:~/.local/bin:$PATH"

# Include Bash Local
source ~/.config/bash/.bash.local

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

# Source starship
eval "$(starship init bash)"

# Dotfiles
alias dotfiles="bash ~/.dotfiles/bin/dotfiles/main.sh"

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias c="clear"

alias exa='command exa --group-directories-first -laFh --grid --git --icons'
alias cat=bat
alias man=batman
alias vim='nvim .'
alias lg=lazygit
alias matrix='cmatrix -aBf'
alias ping=ping_pretty
alias fast='fast -u --single-line'

alias h="history -15"    # last 10 history commands
alias hc="history -c"    # clear history
alias hg="history | rg " # +command

# IP addresses
alias pubip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"


# Functions
# Makes directory and cd's into it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}
export -f mkcd

# Install VSCode command line command
function code() {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}
export -f code

# Adds .gitignore files
function gi() {
    sh ~/.dotfiles/bin/gitignore/gi.zsh
}
export -f gi

# Custom Pretty Ping
function ping_pretty() {

    if [ $# -eq 0 ]; then
        prettyping --nolegend 1.1.1.1
    else
        prettyping --nolegend "$@"
    fi
}
export -f ping_pretty

# Refresh shell config
function sreload() {
	source ~/.config/bash/.bashrc
}
export -f sreload