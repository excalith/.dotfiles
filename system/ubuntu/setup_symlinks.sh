#!/bin/sh

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


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

symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish
symlink ~/.dotfiles/config/fish/aliases.fish ~/.config/fish/aliases.fish
symlink ~/.dotfiles/config/fish/bindings.fish ~/.config/fish/bindings.fish

symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/ping_pretty.fish ~/.config/fish/functions/ping_pretty.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish

# bash config
print_title "Bash configuration"
mkdir -p ~/.config/bash
symlink ~/.dotfiles/config/bash/.bashrc ~/.config/bash/.bashrc
bash --rcfile ~/.config/bash/bashrc

# zsh config
print_title "Zsh configuration"
ln -sf ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/config/zsh/.zprofile ~/.zprofile

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
mkdir -p ~/.config/git
symlink ~/.dotfiles/config/git/config ~/.config/git/config
symlink ~/.dotfiles/config/git/config.local ~/.config/git/config.local
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git/ignore_global

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

# tmux config
print_title "TMUX configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf