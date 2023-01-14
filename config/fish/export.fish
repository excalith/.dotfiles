# Fish User Paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Dotfiles Path
set -gx DOTFILES $HOME"/.dotfiles"	

# Language Default
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Add Path
fish_add_path "./bin"
fish_add_path "/usr/local/bin"
fish_add_path "/usr/local/opt/"

# Export Homebrew Path
set -gx HOMEBREW_CURL_PATH "/usr/bin/curl"

# Export GPG TTY
set -gx GPG_TTY $(tty)

# Editor
set -gx EDITOR "vim"

# FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Grep colors
setenv GREP_OPTIONS "--color=auto"

# Set Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)