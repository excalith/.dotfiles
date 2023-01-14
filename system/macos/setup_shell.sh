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
execute "fisher install PatrickF1/fzf.fish" "fzf"
execute "fisher install nickeb96/puffer-fish" "puffer-fish"
execute "fisher install franciscolourenco/done" "done"
execute "fisher install danhper/fish-ssh-agent" "fish-ssh-agent"


#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"
execute "sudo echo /usr/local/bin/fish >> /etc/shells" "Adding fish to shells"
execute "chsh -s /usr/local/bin/fish" "Changing default shell into fish"
execute "fish_update_completions >/dev/null 2>&1" "Updating fish completions"

