#!/bin/bash

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Linux Dotfile Setup"

# setup symlinks
. ~/.dotfiles/system/ubuntu/setup_symlinks.sh

# setup packages
. ~/.dotfiles/system/ubuntu/setup_packages.sh

# setup fonts
. ~/.dotfiles/system/ubuntu/setup_fonts.sh

# setup defaults
. ~/.dotfiles/system/ubuntu/setup_defaults.sh

# setup shell
. ~/.dotfiles/system/ubuntu/setup_shell.sh
