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


print_title "Creating Symlinks"

# fish config
mkdir -p ~/.config/fish
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/aliases.fish ~/.config/fish/aliases.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish

# starship config
symlink ~/.dotfiles/config/starship ~/.config/starship

# .gitconfig
symlink ~/.dotfiles/config/git/.gitconfig ~

# global .gitignore
symlink ~/.dotfiles/config/git/.gitignore_global ~

# neofetch config
symlink ~/.dotfiles/config/neofetch ~/.config/neofetch

# midnight commander theme
symlink ~/.dotfiles/config/mc ~/.config/mc

# htop config
symlink ~/.dotfiles/config/htop ~/.config/htop

# bat binary fix
mkdir -p ~/.local/bin
symlink /usr/bin/batcat ~/.local/bin/bat
