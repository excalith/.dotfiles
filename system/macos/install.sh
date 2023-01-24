#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_macos.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Linux Dotfile Setup"

# setup symlinks
. "$HOME/.dotfiles/system/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/macos/setup_packages.sh"

# setup defaults
. "$HOME/.dotfiles/system/macos/setup_defaults.sh"

# setup shell
. "$HOME/.dotfiles/system/macos/setup_shell.sh"