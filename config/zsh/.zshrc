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

# forgit
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"

# Setup FASD
eval "$(fasd --init auto)"

# Setup The Fuck
eval $(thefuck --alias)

# Setup GitHub Hub
eval "$(hub alias -s)"

# Setup Antigen
source "$HOME/.config/antigen.zsh"

# Setup Plugins
antigen bundle wfxr/forgit
antigen bundle unixorn/fzf-zsh-plugin@main
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# ZSH Highlight Configuration
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Setup FZF
[ -f ~/.fzf/.fzf.zsh ] && source ~/.fzf/.fzf.zsh
# export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"

# Easy navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Include ZSH Local
source "$HOME/.zsh.local"
source "$HOME/.config/bash/aliases.bash"
source "$HOME/.config/bash/functions.bash"

# Source starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# Custom ZSH Functions and Aliases# Pretty ping alias
alias ping=ping_pretty

# Reload zsh sessions
function sreload() {
    source "$HOME/.zshrc"
	source "$HOME/.zsh.local"
	source "$HOME/.config/bash/aliases.bash"
	source "$HOME/.config/bash/functions.bash"

    tmux display-message "ZSH Shell Config Reloaded"
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

    tmux display-message "ZSH Shell Update Complete"
}