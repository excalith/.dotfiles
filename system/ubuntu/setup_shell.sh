#!/bin/sh

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Shell Setup"


#==================================
# Install Fish
#==================================
print_title "Installing Fish"
apt_install "Fish" "fish"


#==================================
# Install Starship
#==================================
curl -sS https://starship.rs/install.sh | sh -s -- -y  >/dev/null 2>&1
print_result $? "Starship" "true"


#==================================
# Install fisher
#==================================
fish <<'END_FISH'
    curl -sL https://git.io/fisher | source 
END_FISH
print_result $? "Fisher" "true"


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

sudo sed -i '/auth       required   pam_shells.so/ s//auth       sufficient   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1
echo $(which fish) | sudo tee -a /etc/shells >/dev/null 2>&1
sudo chsh -s $(which fish) >/dev/null 2>&1
sudo sed -i '/auth       sufficient   pam_shells.so/ s//auth       required   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1

fish <<'END_FISH'
    fish_update_completions >/dev/null 2>&1
END_FISH

print_result $? "Change fish as default shell" "true"


