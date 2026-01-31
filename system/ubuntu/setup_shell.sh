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
# Install ZSH
#==================================
print_title "Installing ZSH"
apt_install "ZSH" "zsh"

curl -L git.io/antigen > "$HOME/.config/antigen.zsh"
print_progress "Installing Antigen"


#==================================
# Install starship prompt
#==================================
print_title "Installing Starship Prompt"
curl -sS https://starship.rs/install.sh | sh -s -- -y  >/dev/null 2>&1
print_result $? "Starship" "true"


#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"

# 1. Temporarily relax PAM requirements for chsh
print_in_green "Updating PAM config"
sudo sed -i 's/auth.*required.*pam_shells.so/auth sufficient pam_shells.so/' /etc/pam.d/chsh >/dev/null 2>&1

# 2. Add ZSH to /etc/shells if not already present
print_in_green "Adding ZSH to approved shells"
ZSH_PATH=$(which zsh)
if ! grep -Fxq "$ZSH_PATH" /etc/shells; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null 2>&1
fi

# 3. Change the shell to ZSH
print_in_green "Switching default shell to ZSH"
sudo chsh -s "$ZSH_PATH" "$USER" >/dev/null 2>&1
CHSH_RESULT=$?

# 4. Restore PAM requirements
print_in_green "Restoring PAM config"
sudo sed -i 's/auth.*sufficient.*pam_shells.so/auth required pam_shells.so/' /etc/pam.d/chsh >/dev/null 2>&1

print_result $CHSH_RESULT "Change ZSH as default shell" "true"


