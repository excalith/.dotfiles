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
print_section "Shell Setup"


#==================================
# Install ZSH
#==================================
print_title "Installing ZSH"
apt_install "ZSH" "zsh"

curl -L git.io/antigen > "$HOME/.config/antigen.zsh"
print_progress "Installing Antigen"

#==================================
# Install Fish
#==================================
print_title "Installing Fish"
apt_install "Fish" "fish"


#==================================
# Install Fisher
#==================================
fish <<'END_FISH'
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher >/dev/null 2>&1
END_FISH
print_result $? "Fisher" "true"


#==================================
# Install fish packages
#==================================
print_title "Installing Fish Packages"
fisher_install "FZF" "PatrickF1/fzf.fish"
fisher_install "Puffer Fish" "nickeb96/puffer-fish"
fisher_install "Done" "franciscolourenco/done"
fisher_install "Fish SSH Agent" "danhper/fish-ssh-agent"


#==================================
# Install starship prompt
#==================================
print_title "Installing Starship Prompt"
curl -sS https://starship.rs/install.sh | sh -s -- -y  >/dev/null 2>&1
print_result $? "Starship" "true"


#==================================
# Instal TMUX Plugins
#==================================
~/.tmux/plugins/tpm/scripts/install_plugins.sh


#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"

print_in_green "sed 1"
sudo sed -i '/auth       required   pam_shells.so/ s//auth       sufficient   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1
print_in_green "tee fish -> shells"
which fish | sudo tee -a /etc/shells >/dev/null 2>&1
print_in_green "chsh which fish"
sudo chsh -s "$(which fish)" >/dev/null 2>&1
print_in_green "sed 2"
sudo sed -i '/auth       sufficient   pam_shells.so/ s//auth       required   pam_shells.so/g' /etc/pam.d/chsh >/dev/null 2>&1

print_result $? "Change fish as default shell" "true"


