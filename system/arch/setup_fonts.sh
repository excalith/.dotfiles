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
print_section "Installing Fonts"

execute "yay -S otf-firamono-nerd" "Fira Mono Nerd Font"