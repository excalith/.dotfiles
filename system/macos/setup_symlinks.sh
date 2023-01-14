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


#==================================
# Symlink
#==================================
print_title "Symlink config files"

# fish config
mkdir -p ~/.config/fish
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/aliases.fish ~/.config/fish/aliases.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish

# starship config
symlink ~/.dotfiles/config/starship ~/.config/starship

# .gitconfig
symlink ~/.dotfiles/Generic/git/.gitconfig ~

# global .gitignore
symlink ~/.dotfiles/Generic/git/.gitignore_global ~

# neofetch config
symlink ~/.dotfiles/Generic/neofetch/config.conf ~/.config/neofetch/config.conf

# midnight commander theme
symlink ~/.dotfiles/Generic/mc/arasaka.ini ~/.local/share/mc/skins/arasaka.ini
symlink ~/.dotfiles/Generic/mc/ini ~/.config/mc/ini

# htop config
symlink ~/.dotfiles/Generic/htop/htoprc ~/.config/htop/htoprc

# alacritty config
symlink ~/.dotfiles/Generic/alacritty ~/.config/alacritty

# yabai config
symlink ~/.dotfiles/Generic/yabai/.yabairc ~/.yabairc

# skhd config
symlink ~/.dotfiles/Generic/skhd/.skhdrc ~/.skhdrc

# tmux config
symlink ~/.dotfiles/Generic/tmux/.tmux.conf ~/.tmux.conf