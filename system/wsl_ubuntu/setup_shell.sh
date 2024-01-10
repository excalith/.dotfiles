#!/bin/bash
# shellcheck disable=SC1091

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
# Generating en_US locale
#==================================
print_title "Generate Locale"
sudo locale-gen en_US.UTF-8 >/dev/null 2>&1
print_result $? "en_US.UTF-8" "true"

#==================================
# Install starship prompt
#==================================
print_title "Installing Starship Prompt"
curl -sS https://starship.rs/install.sh | sh -s -- -y  >/dev/null 2>&1
print_result $? "Starship" "true"


#==================================
# Install ZSH
#==================================
print_title "Installing ZSH"
apt_install "ZSH" "zsh"

curl -L git.io/antigen > "$HOME/.config/antigen.zsh" >/dev/null 2>&1
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
# Instal TMUX Plugins
#==================================
~/.tmux/plugins/tpm/scripts/install_plugins.sh


#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"

sudo chsh -s $(which zsh)
print_result $? "Change zsh as default shell" "true"


#==================================
# Change Default Shell
#==================================
print_title "Creating SSH Directory"

if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    print_in_green "   Created empy .ssh folder"
else
    print_in_yellow "   SSH folder already exists"
fi
