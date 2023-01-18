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
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish
symlink ~/.dotfiles/config/fish/aliases.fish ~/.config/fish/aliases.fish
symlink ~/.dotfiles/config/fish/bindings.fish ~/.config/fish/bindings.fish

symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/pingpretty.fish ~/.config/fish/functions/pingpretty.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish
touch ~/.config/fish/local.fish

# bash config
print_title "Bash configuration"
symlink ~/.dotfiles/config/bash/.bashrc ~/.config/bash/.bashrc
touch ~/.config/bash/.bash.local
bash <<'END_BASH'
    --rcfile ~/.config/bash/.bashrc >/dev/null 2>&1
END_BASH

# zsh config
print_title "Zsh configuration"
ln -sf ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/config/zsh/.zprofile ~/.zprofile
touch ~/.zsh.local

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
touch ~/.dotfiles/config/git/config.local
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
symlink ~/.dotfiles/config/alacritty/alacrittyLinux.yml ~/.config/alacritty/alacritty.yml

# tmux config
print_title "tmux configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# bat configuration
print_title "bat binary"
symlink /usr/bin/batcat ~/.local/bin/bat
