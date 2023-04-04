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
print_section "Installing Packages"

#==================================
# Update APT packages
#==================================
print_title "Update Packages"
pacman_update

#==================================
# Install essential packages
#==================================
print_title "Install Essential Packages"
pacman_install "git" "git"
pacman_install "base-devel" "base-devel"

#==================================
# Install AUR helper
#==================================
print_title "Install Yay"
git clone --quiet https://aur.archlinux.org/yay.git /tmp/yay
cd ~/tmp/yay
makepkg -sfci --noconfirm --needed --silend >/dev/null 2>&1

#==================================
# Install package managers
#==================================
print_title "Install Package Managers"
pacman_install "flatpak" "flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1


#==================================
# Install Pacman packages
#==================================
print_title "Install Pacman Packages"
pacman_install "Gnome Shell Extensions" "gnome-shell-extensions"
pacman_install "Gnome Tweaks" "gnome-tweaks"

pacman_install "gnupg" "gnupg"
pacman_install "ca-certificates" "ca-certificates"
pacman_install "curl" "curl"
pacman_install "wget" "wget"
pacman_install "pyhton3" "python3"
pacman_install "git" "git"
pacman_install "git-lfs" "git-lfs"

pacman_install "tmux" "tmux"
pacman_install "less" "less"
pacman_install "exa" "exa"
pacman_install "bat" "bat"
pacman_install "fasd" "fasd"
pacman_install "fzf" "fzf"
pacman_install "ripgrep" "ripgrep"

pacman_install "gum" "gum"
pacman_install "htop" "htop"
pacman_install "httpie" "httpie"
pacman_install "prettyping" "prettyping"
pacman_install "mtr" "mtr"

pacman_install "tldr" "tldr"
pacman_install "neofetch" "neofetch"

pacman_install "ranger" "ranger"
pacman_install "midnight-commander" "mc"
pacman_install "node" "nodejs"
pacman_install "yarn" "yarn"
pacman_install "gcc" "gcc"
pacman_install "neovim" "neovim"
pacman_install "ffmpeg" "ffmpeg"

pacman_install "Alacritty" "alacritty"


#==================================
# Install Snap packages
#==================================
print_title "Install Snap Packages"
systemtcl enable --now snapd.apparmor
snap_install "spt" "spt"
snap_install "VS Code" "code"
snap_install "1Password" "1password"


#==================================
# Install Flatpak Packages
#==================================
print_title "Install Flatpak Packages"
flatpak_install "Firefox" "org.mozilla.firefox"
flatpak_install "GitKraken" "com.axosoft.GitKraken"
flatpak_install "Insomnia" "rest.insomnia.Insomnia"
flatpak_install "Beekeeper Studio" "io.beekeeperstudio.Studio"
flatpak_install "Image Optimizer" "com.github.gijsgoudzwaard.image-optimizer"
flatpak_install "Mailspring" "com.getmailspring.Mailspring"
flatpak_install "Telegram" "org.telegram.desktop"
flatpak_install "Discord" "com.discordapp.Discord"
flatpak_install "Zoom" "us.zoom.Zoom"
flatpak_install "Dropbox" "com.dropbox.Client"
flatpak_install "Transmission" "com.transmissionbt.Transmission"
flatpak_install "Spotify" "com.spotify.Client"
flatpak_install "VLC" "org.videolan.VLC"
flatpak_install "Steam" "com.valvesoftware.Steam"


#==================================
# Install From Source
#==================================
print_title "Install Packages From Source"

# Tmux Plugin Manager (TPM)
execute "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" "TMUX Plugin Manager (TPM)"

# LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz --silent --output /dev/null "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz
print_success "lazygit"

# Reversal Icons
wget -qO ~/reversal.tar.gz https://github.com/yeyushengfan258/Reversal-icon-theme/archive/master.tar.gz
mkdir -p ~/reversal-icons
tar --extract \
	--gzip \
	--file ~/reversal.tar.gz \
	--strip-components 1 \
	--directory ~/reversal-icons

cd ~/reversal-icons && . install.sh -a &> /dev/null
print_success "Reversal Icons"

rm -rf ~/reversal-icons
rm -rf ~/master.tar.gz


#==================================
# Install Extensions
#==================================
print_title "Install Gnome Extensions"
extension_install "Dash To Dock (COSMIC)" "https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/"
extension_install "User Themes" "https://extensions.gnome.org/extension/19/user-themes/"
extension_install "Blur My Shell" "https://extensions.gnome.org/extension/3193/blur-my-shell/"
extension_install "Rounded Corners" "https://extensions.gnome.org/extension/1514/rounded-corners/"
extension_install "Places Status Indicator" "https://extensions.gnome.org/extension/8/places-status-indicator/"
extension_install "Always Indicator" "https://extensions.gnome.org/extension/2594/always-indicator/"
extension_install "Removable Drive Menu" "https://extensions.gnome.org/extension/7/removable-drive-menu/"
extension_install "Caffeine" "https://extensions.gnome.org/extension/517/caffeine/"
extension_install "Impatience" "https://extensions.gnome.org/extension/277/impatience/"
extension_install "User Avatar" "https://extensions.gnome.org/extension/5506/user-avatar-in-quick-settings/"
