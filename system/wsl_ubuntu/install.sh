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
print_section "Running Windows WSL Ubuntu Dotfiles Setup"

# setup symlinks
. "$HOME/.dotfiles/system/wsl_ubuntu/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/wsl_ubuntu/setup_packages.sh"

# setup shell
. "$HOME/.dotfiles/system/wsl_ubuntu/setup_shell.sh"
