#!/bin/bash

#==================================
# Source utilities
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh" \
    && . "../../scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Running Linux Dotfile Setup"


cd "../../system/ubuntu"

# setup packages
. ~/.dotfiles/system/ubuntu/setup_packages.sh

# setup fonts
. ~/.dotfiles/system/ubuntu/setup_fonts.sh

# setup shell
. ~/.dotfiles/system/ubuntu/setup_shell.sh

# setup symlinks
. ~/.dotfiles/system/ubuntu/setup_symlinks.sh

# setup defaults
. ~/.dotfiles/system/ubuntu/setup_defaults.sh