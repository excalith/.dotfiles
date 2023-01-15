#!/bin/sh

#==================================
# Source utilities
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh" \
    && . "../../scripts/utils/utils_ubuntu.sh"

#==================================
# Print Section Title
#==================================
print_section "Installing Fish Shell"


#==================================
# Install Fish
#==================================
print_title "Installing Fish Setup"
brew_install "Fish" "fish"
brew_install "Starship" "starship"
brew_install "Fisher" "fisher"


#==================================
# Install fish packages
#==================================
print_title "Installing Fish Packages"
fisher_install "Fisher" "jorgebucaran/fisher"
fisher_install "FZF" "PatrickF1/fzf.fish"
fisher_install "Puffer Fish" "nickeb96/puffer-fish"
fisher_install "Done" "franciscolourenco/done"
fisher_install "Fish SSH Agent" "danhper/fish-ssh-agent"


#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"
execute "sudo echo /usr/local/bin/fish >> /etc/shells" "Adding fish to shells"
execute "chsh -s /usr/local/bin/fish" "Changing default shell into fish"
execute "fish_update_completions >/dev/null 2>&1" "Updating fish completions"

