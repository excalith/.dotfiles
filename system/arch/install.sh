#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_arch.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Arch Dotfiles Setup"

# setup symlinks
. "$HOME/.dotfiles/system/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/arch/setup_packages.sh"

# setup fonts
. "$HOME/.dotfiles/system/arch/setup_fonts.sh"

# setup defaults
. "$HOME/.dotfiles/system/arch/setup_defaults.sh"

# setup shell
. "$HOME/.dotfiles/system/arch/setup_shell.sh"
