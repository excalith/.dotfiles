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


#==================================
# Symlink
#==================================

# fish config
print_title "Fish configuration"
touch ~/.config/fish/local.fish
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish
symlink ~/.dotfiles/config/fish/aliases.fish ~/.config/fish/aliases.fish
symlink ~/.dotfiles/config/fish/bindings.fish ~/.config/fish/bindings.fish

symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/pingpretty.fish ~/.config/fish/functions/pingpretty.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish

# bash config
print_title "Bash configuration"
touch ~/.config/bash/.bash.local
symlink ~/.dotfiles/config/bash/.bashrc ~/.config/bash/.bashrc
bash <<'END_BASH'
    --rcfile ~/.config/bash/.bashrc >/dev/null 2>&1
END_BASH

# zsh config
print_title "Zsh configuration"
touch ~/.zsh.local
ln -sf ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/config/zsh/.zprofile ~/.zprofile

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
symlink ~/.dotfiles/config/git/config ~/.config/git/config
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git/ignore_global

# neofetch config
print_title "Neofetch configuration"
symlink ~/.dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf

# midnight commander theme
print_title "Midnight Commander configuration"
symlink ~/.dotfiles/config/mc/ini ~/.config/mc/ini
symlink ~/.dotfiles/config/mc/Arasaka.ini ~/.local/share/mc/skins/Arasaka.ini

# htop config
print_title "htop configuration"
symlink ~/.dotfiles/config/htop/htoprc ~/.config/htop/htoprc

# alacritty config
print_title "Alacritty configuration"
symlink ~/.dotfiles/config/alacritty/alacritty_macos.yml ~/.config/alacritty/alacritty.yml

# tmux config
print_title "TMUX configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# yabai config
print_title "Yabai configuration"
symlink ~/.dotfiles/config/yabai/.yabairc ~/.config/yabairc

# skhd config
print_title "SKHD configuration"
symlink ~/.dotfiles/config/skhd/.skhdrc ~/.config/skhdrc

