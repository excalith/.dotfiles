#!/bin/bash

#==================================
# Tiny Utilities
#==================================
print_section() {
    local TITLE="$*"
    local TITLE_LENGTH=${#TITLE}
    local BORDER_LENGTH=$((TITLE_LENGTH + 18))

    local i
    local BANNER_TOP
    for (( i = 0; i < BORDER_LENGTH; ++i )); do
        if [ $i = 0 ]; then
            BANNER_TOP+="╭"
        elif [ $i = $(($BORDER_LENGTH-1)) ]; then
            BANNER_TOP+="╮"
        else
            BANNER_TOP+="─"
        fi
    done

    local BANNER_BOTTOM
    for (( i = 0; i < BORDER_LENGTH; ++i )); do
        if [ $i = 0 ]; then
            BANNER_BOTTOM+="╰"
        elif [ $i = $(($BORDER_LENGTH-1)) ]; then
            BANNER_BOTTOM+="╯"
        else
            BANNER_BOTTOM+="─"
        fi
    done

    print_line_break
    print_in_green "$BANNER_TOP"
    print_in_green "\n│        $TITLE        │\n"
    print_in_green "$BANNER_BOTTOM"
    print_line_break
}

print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}

print_line_break() {
    printf "\n"
}

print_in_white() {
    print_in_color "$1" 7
}

print_in_green() {
    print_in_color "$1" 2
}

print_title() {
    print_in_color "\n$1\n" 2
}

print_log() {
    print_in_white " • $1\n"
}

symlink() {
    mkdir -p $(dirname "$2")
    ln -sf $1 $2
    print_log "$(basename $1)    →    $2"
}

install_apt() {
    declare -r PACKAGE="$1"
    declare -r PACKAGE_READABLE_NAME="$2"

    print_log "Installing $PACKAGE_READABLE_NAME"
    sudo apt install --allow-unauthenticated -qqy $PACKAGE &> /dev/null
}

add_repository() {
    declare -r PACKAGE="$1"
    declare -r PACKAGE_READABLE_NAME="$2"

    print_log "Adding $PACKAGE_READABLE_NAME repository"
    sudo apt-add-repository -y "$PACKAGE" &> /dev/null
}

#==================================
# Start Setup
#==================================
sudo -v &> /dev/null
print_section "Installing Packages"


#==================================
# Add repositories to apt
#==================================
print_title "Add Repositories To APT"
add_repository "universe" "Universe"
add_repository "multiverse" "Multiverse" 
add_repository "ppa:fish-shell/release-3" "Fish Shell" 


#==================================
# Update APT packages
#==================================
print_title "Update & Upgrade"

print_log "APT Update"
apt update &> /dev/null

print_log "APT Upgrade"
apt upgrade &> /dev/null


#==================================
# Install APT packages
#==================================
print_title "Installing APT Packages"

install_apt "curl" "curl"
install_apt "wget" "wget"
install_apt "pyhton3" "pyhton 3"
install_apt "git" "git"
install_apt "git-all" "git-all"
install_apt "git-lfs" "git-lfs"

install_apt "tmux" "tmux"
install_apt "less" "less"
install_apt "exa" "exa"
install_apt "bat" "bat"
install_apt "tre-command" "tre-command"
install_apt "fasd" "fasd"
install_apt "fd-find" "fd-find"
install_apt "fzf" "fzf"
install_apt "ripgrep" "ripgrep"

install_apt "htop" "htop"
install_apt "httpie" "httpie"
install_apt "prettyping" "prettyping"
install_apt "neofetch" "neofetch"


#==================================
# Install From Source
#==================================
print_title "Installing Packages From Source"

# Tmux Plugin Manager (TPM)
print_log "Cloning Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# LazyGit
print_log "Downloading LazyGit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz --silent --output /dev/null "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz





#==================================
# Print Section Title
#==================================
print_section "Creating Symlinks"


#==================================
# Symlink
#==================================

# fish config
print_title "Fish configuration"
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish
symlink ~/.dotfiles/config/fish/bindings.fish ~/.config/fish/bindings.fish

symlink ~/.dotfiles/config/fish/functions/arasaka.fish ~/.config/fish/functions/arasaka.fish
symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/flushdns.fish ~/.config/fish/functions/flushdns.fish
symlink ~/.dotfiles/config/fish/functions/gi.fish ~/.config/fish/functions/gi.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/c_prettyping.fish ~/.config/fish/functions/c_prettyping.fish
symlink ~/.dotfiles/config/fish/functions/c_mtr.fish ~/.config/fish/functions/c_mtr.fish
symlink ~/.dotfiles/config/fish/functions/ql.fish ~/.config/fish/functions/ql.fish
symlink ~/.dotfiles/config/fish/functions/sreload.fish ~/.config/fish/functions/sreload.fish
symlink ~/.dotfiles/config/fish/functions/treload.fish ~/.config/fish/functions/treload.fish
symlink ~/.dotfiles/config/fish/functions/supdate.fish ~/.config/fish/functions/supdate.fish
symlink ~/.dotfiles/config/fish/functions/pupdate.fish ~/.config/fish/functions/pupdate.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish
touch ~/.config/fish/local.fish

# bash config
print_title "Bash configuration"
symlink ~/.dotfiles/config/bash/.bashrc ~/.bashrc
symlink ~/.dotfiles/config/bash/aliases.bash ~/.config/bash/aliases.bash
symlink ~/.dotfiles/config/bash/functions.bash ~/.config/bash/functions.bash
touch ~/.bash.local

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
symlink ~/.dotfiles/config/git/config ~/.config/git/config
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git/ignore_global
touch ~/.config/git/config.local

# neofetch config
print_title "Neofetch configuration"
symlink ~/.dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf

# fastfatch config
print_title "Fastfatch configuration"
symlink ~/.dotfiles/config/fastfatch/config.conf ~/.config/fastfatch/config.conf 

# alacritty config
print_title "Alacritty configuration"
symlink ~/.dotfiles/config/alacritty/alacrittyLinux.yml ~/.config/alacritty/alacritty.yml

# tmux config
print_title "tmux configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# lunar vim config
print_title "LunarVim configuration"
symlink ~/.dotfiles/config/lvim/config.lua ~/.config/lvim/config.lua

# bat configuration
print_title "bat binary"
symlink /usr/bin/batcat ~/.local/bin/bat
