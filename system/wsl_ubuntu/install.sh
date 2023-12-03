#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Windows WSL Dotfiles Setup"

# setup symlinks
. "$HOME/.dotfiles/system/wsl/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/wsl/setup_packages.sh"

# setup shell
. "$HOME/.dotfiles/system/wsl/setup_shell.sh"
