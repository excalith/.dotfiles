#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_alpine.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Alpine Dotfiles Setup"

# setup symlinks
. "$HOME/.dotfiles/system/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/alpine/setup_packages.sh"

# setup shell
. "$HOME/.dotfiles/system/alpine/setup_shell.sh"
