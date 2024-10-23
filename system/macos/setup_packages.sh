#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_macos.sh"


#==================================
# Print Section Title
#==================================
print_section "Installing Packages"


#==================================
# Install Brew
#==================================
print_title "Installing Brew"
if ! cmd_exists "brew"; then
	printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	#  └─ simulate the ENTER keypress
fi
print_result $? "Homebrew"

brew_update
brew_upgrade


#==================================
# Brew Tap
#==================================
print_title "Tapping Brew Packages"
brew_tap 'homebrew/core'
brew_tap 'homebrew/bundle'
brew_tap 'homebrew/cask' || true
brew_tap 'homebrew/cask-versions'
brew_tap 'homebrew/cask-fonts'
brew_tap 'eth-p/software'
brew_tap 'teamookla/speedtest'


#==================================
# Brew Install
#==================================
print_title "Installing Brew Packages"
brew_install "wget" "wget"
brew_install "mas" "mas"
brew_install "fd" "fd"
brew_install "fasd" "fasd"
brew_install "fzf" "fzf"
brew_install "dockutil" "dockutil"
brew_install "git" "git"
brew_install "git" "git-lfs"
brew_install "git" "git-delta"
brew_install "lazygit" "lazygit"
brew_install "git" "git-quick-stats"
brew_install "cloc" "cloc"
brew_install "navi" "navi"
brew_install "nano" "nano"
brew_install "node" "node"
brew_install "yarn" "yarn"
brew_install "mono" "mono"
brew_install "gcc" "gcc"
brew_install "gum" "gum"
brew_install "shellcheck" "shellcheck"
brew_install "less" "less"
brew_install "tre" "tre-command"
brew_install "tree" "tree"
brew_install "prettyping" "prettyping"
brew_install "mtr" "mtr"
brew_install "eza" "eza"
brew_install "bat" "bat"
brew_install "bat-extras" "eth-p/software/bat-extras"
brew_install "viu" "viu"
brew_install "htop" "htop"
brew_install "pidof" "pidof"
brew_install "httpie" "httpie"
brew_install "neofetch" "neofetch"
brew_install "neovim" "neovim"
brew_install "micro" "micro"
brew_install "tmux" "tmux"
brew_install "ripgrep" "ripgrep"
brew_install "ranger" "ranger"
brew_install "midnight" "midnight-commander"
brew_install "ffmpeg" "ffmpeg"
brew_install "speedtest" "speedtest"
brew_install "tldr" "tldr"
brew_install "spotify-tui" "spotify-tui"
brew_install "no-more-secrets" "no-more-secrets"
brew_install "yabai" "koekeishiya/formulae/yabai"
brew_install "skhd" "koekeishiya/formulae/skhd"
brew_install "cmatrix" "cmatrix"
brew_install "nudoku" "nudoku"


#==================================
# Brew Cask
#==================================
print_title "Installing Brew Casks"
brew_install "Firefox" "firefox" "--cask"
brew_install "Firefox Developer" "firefox-developer-edition" "--cask"
brew_install "Brave Browser" "brave-browser" "--cask"
brew_install "Alacritty" "alacritty" "--cask"
# brew_install "Kitty" "kitty" "--cask"
brew_install "Karabiner-Elements" "karabiner-elements" "--cask"
brew_install "VS Code" "visual-studio-code" "--cask"
brew_install "Unity3D" "unity-hub" "--cask"
brew_install "gpg" "gpg" "--cask"
brew_install "gpg suite" "gpg-suite" "--cask"
brew_install "keybase" "keybase" "--cask"
brew_install "Fork" "fork" "--cask"
brew_install "Keka" "keka" "--cask"
brew_install "Optimage" "optimage" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Slack" "slack" "--cask"
brew_install "Zoom" "zoom" "--cask"
brew_install "Transmission" "transmission" "--cask"
brew_install "Transmit" "transmit" "--cask"
brew_install "OBS Studio" "obs" "--cask"
brew_install "Alfred" "alfred" "--cask"
brew_install "Bartender" "bartender" "--cask"
brew_install "Handbrake" "handbrake" "--cask"
brew_install "Blender" "blender" "--cask"
brew_install "Sketch" "sketch" "--cask"
brew_install "Sip" "sip" "--cask"
brew_install "WhatsApp" "whatsapp" "--cask"
brew_install "Cleanmymac" "cleanmymac" "--cask"
brew_install "Dropbox" "dropbox" "--cask"
brew_install "FiraCode Nerd Font" "font-fira-code-nerd-font" "--cask"


#==================================
# Brew MAS
#==================================
print_title "Installing Brew MAS"
brew_mas_install "XCode", "497799835"
brew_mas_install "1Password", "1333542190"
brew_mas_install "Affinity Photo", "824183456"
brew_mas_install "Affinity Designer", "824171161"
brew_mas_install "Affinity Publisher", "881418622"
brew_mas_install "Spark", "1176895641"
brew_mas_install "Telegram", "747648890"
brew_mas_install "Reeder 5", "1529448980"
brew_mas_install "Fantastical", "975937182"
brew_mas_install "Lungo", "1263070803"
brew_mas_install "SnippetsLab", "1006087419"
brew_mas_install "CARROT Weather", "993487541"
brew_mas_install "Moom", "419330170"
brew_mas_install "Displaperture", "1543920362"
brew_mas_install "Gifski", "1351639930"
brew_mas_install "Elmedia Player", "937759555"
brew_mas_install "Friendly Streaming Browser", "553245401"
brew_mas_install "iPreview", "1519213509"
brew_mas_install "Craft", "1487937127"


#==================================
# Brew Services
#==================================
print_title "Starting Brew Services"
brew_start_service "yabai" "yabai"
brew_start_service "skhd" "skhd"


#==================================
# Yarn
#==================================
print_title "Installing Yarn Packages"
yarn_install "Serve" "serve"


#==================================
# Install From Source
#==================================
print_title "Install Packages From Source"

# LunarVim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh) -y

# NvChad
# rm -rf ~/.config/nvim
# rm -rf ~/.local/share/nvim
# rm -rf ~/.cache/nvim
# execute "git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1" "NvChad"

# Tmux Plugin Manager (TPM)
execute "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" "TMUX Plugin Manager (TPM)"
