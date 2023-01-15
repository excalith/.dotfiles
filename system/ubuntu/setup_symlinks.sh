#!/bin/sh

#==================================
# Source utilities
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh"


#==================================
# Print Section Title
#==================================
print_section "Creating Symlinks"
mkdir -p ~/.config


#==================================
# Symlink
#==================================

# fish config
print_title "Fish configuration"
mkdir -p ~/.config/fish/theme
mkdir -p ~/.config/fish/functions
symlink  ~/.dotfiles/config/fish/*.fish ~/.config/fish
symlink  ~/.dotfiles/config/fish/theme/*.fish ~/.config/fish/theme

# bash config
print_title "Bash configuration"
symlink ~/.dotfiles/config/bash ~/.config
# bash --rcfile ~/.config/bash/bashrc

# zsh config
print_title "Zsh configuration"
ln -sf ~/.dotfiles/config/zsh/.zshrc ~/
ln -sf ~/.dotfiles/config/zsh/.zprofile ~/

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config

# git config
print_title "Git configuration"
mkdir -p ~/.config/git
symlink ~/.dotfiles/config/git/config ~/.config/git
symlink ~/.dotfiles/config/git/config.local ~/.config/git
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git

# neofetch config
print_title "Neofetch configuration"
mkdir -p ~/.config/neofetch
symlink ~/.dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf

# midnight commander theme
print_title "Midnight Commander configuration"
mkdir -p ~/.config/mc
mkdir -p ~/.local/share/mc/skins
symlink ~/.dotfiles/config/mc/ini ~/.config/mc/ini
symlink ~/.dotfiles/config/mc/Arasaka.ini ~/.local/share/mc/skins/Arasaka.ini

# htop config
print_title "htop configuration"
mkdir -p ~/.config/htop
symlink ~/.dotfiles/config/htop/htoprc ~/.config/htop/htoprc

# alacritty config
print_title "Alacritty configuration"
symlink ~/.dotfiles/config/alacritty ~/.config/alacritty

# yabai config
print_title "Yabai configuration"
symlink ~/.dotfiles/config/yabai/.yabairc ~/.config/yabairc

# skhd config
print_title "SKHD configuration"
symlink ~/.dotfiles/config/skhd/.skhdrc ~/.config/skhdrc

# tmux config
print_title "TMUX configuration"
symlink ~/.dotfiles/config/tmux/.tmux.conf ~/.tmux.conf