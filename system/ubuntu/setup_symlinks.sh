#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


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

symlink ~/.dotfiles/config/fish/functions/arsaka.fish ~/.config/fish/functions/arsaka.fish
symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/flushdns.fish ~/.config/fish/functions/flushdns.fish
symlink ~/.dotfiles/config/fish/functions/gi.fish ~/.config/fish/functions/gi.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/pping.fish ~/.config/fish/functions/pping.fish
symlink ~/.dotfiles/config/fish/functions/sreload.fish ~/.config/fish/functions/sreload.fish
symlink ~/.dotfiles/config/fish/functions/supdate.fish ~/.config/fish/functions/supdate.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish
touch ~/.config/fish/local.fish

# bash config
print_title "Bash configuration"
symlink ~/.dotfiles/config/bash/.bashrc ~/.bashrc
touch ~/.bash.local

# zsh config
print_title "Zsh configuration"
symlink ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
touch ~/.zsh.local

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
symlink ~/.dotfiles/config/git/config ~/.config/git/config
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git/ignore_global
touch ~/.dotfiles/config/git/config.local

# neofetch config
print_title "Neofetch configuration"
symlink ~/.dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf

# midnight commander theme
print_title "Midnight Commander configuration"
symlink ~/.dotfiles/config/mc/ini ~/.config/mc/ini
symlink ~/.dotfiles/config/mc/Arasaka.ini ~/.local/share/mc/skins/Arasaka.ini

# alacritty config
print_title "Alacritty configuration"
symlink ~/.dotfiles/config/alacritty/alacrittyLinux.yml ~/.config/alacritty/alacritty.yml

# kitty config
print_title "Kitty configuration"
symlink ~/.dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
symlink ~/.dotfiles/config/kitty/keymapLinux.conf ~/.config/kitty/keymap.conf
symlink ~/.dotfiles/config/kitty/openactions.conf ~/.config/kitty/openactions.conf
symlink ~/.dotfiles/config/kitty/theme.conf ~/.config/kitty/theme.conf

# tmux config
print_title "tmux configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# bat configuration
print_title "bat binary"
symlink /usr/bin/batcat ~/.local/bin/bat
