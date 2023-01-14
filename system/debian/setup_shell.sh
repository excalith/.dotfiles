#!/bin/sh

echo "$(tput setaf 10)┌─────────────────────────────────┐$(tput sgr0)"
echo "$(tput setaf 10)│     Installing Fish Shell       │$(tput sgr0)"
echo "$(tput setaf 10)└─────────────────────────────────┘$(tput sgr0)"

#==================================
# Source utilities
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh" \
    && . "../../scripts/utils/utils_debian.sh"

#==================================
# Install Fish
#==================================
print_title "Installing Fish Setup"
apt_install "Fish" "fish"


#==================================
# Install Starship
#==================================
curl -sS https://starship.rs/install.sh | sh -s -- -y  >/dev/null 2>&1
starship init fish | source
print_success "Starship"


#==================================
# Install fisher
#==================================
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher >/dev/null 2>&1
print_success "Fisher"


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
sudo sed -i '/auth       required   pam_shells.so/ s//auth       sufficient   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1
sudo chsh -s $(which fish) >/dev/null 2>&1
sudo sed -i '/auth       sufficient   pam_shells.so/ s//auth       required   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1
fish_update_completions >/dev/null 2>&1

