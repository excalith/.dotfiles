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
print_section "Installing Packages"


#==================================
# Add keys to apt
#==================================
print_title "Adding Keys"
execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" "Mono (Add Key)"

#==================================
# Add repositories to apt
#==================================
print_title "Adding Repositories"
apt_add_repo "Universe" "universe"
apt_add_repo "Multiverse" "multiverse"
apt_add_repo "Fish" "ppa:fish-shell/release-3"
apt_add_repo "Alacritty" "ppa:aslatter/ppa"
apt_add_repo "uLauncher" "ppa:agornostal/ulauncher"


#==================================
# Add sources to APT
#==================================
# print_title "Adding Sources"


#==================================
# Update APT packages
#==================================
print_title "Update & Upgrade APT"
apt_update
apt_upgrade


#==================================
# Install package managers
#==================================
print_title "Install Package Managers"
apt_install "nala" "nala"
apt_install "flatpak" "flatpak"
apt_install "flatpak gnome plugin" "gnome-software-plugin-flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1


#==================================
# Install APT packages
#==================================
print_title "Install APT Packages"
apt_install "Build Essential" "build-essential"
apt_install "Gnome Tweaks" "gnome-shell-extensions gnome-tweaks"

apt_install "Alacritty" "alacritty"
apt_install "uLauncher" "ulauncher"
apt_install "Caffeine" "caffeine"
apt_install "Notion" "notion"

apt_install "gnupg" "gnupg"
apt_install "gpg" "gpg"
apt_install "ca-certificates" "ca-certificates"
apt_install "dirmngr" "dirmngr"
apt_install "curl" "curl"
apt_install "wget" "wget"
apt_install "git" "git"
apt_install "git-all" "git-all"
apt_install "git-lfs" "git-lfs"
apt_install "apt-transport-https" "apt-transport-https"
apt_install "software-properties-common" "software-properties-common"
apt_install "libgconf-2-4" "libgconf-2-4"

apt_install "less" "less"
apt_install "exa" "exa"
apt_install "bat" "bat"
apt_install "tre-command" "tre-command"
apt_install "fzf" "fzf"
apt_install "ripgrep" "ripgrep"

apt_install "htop" "htop"
apt_install "httpie" "httpie"
apt_install "prettyping" "prettyping"

apt_install "tldr" "tldr"
apt_install "thefuck" "thefuck"
apt_install "neofetch" "neofetch"

apt_install "midnight-commander" "mc"
apt_install "node" "nodejs"
apt_install "yarn" "yarn"
apt_install "gcc" "gcc"
apt_install "neovim" "neovim"
apt_install "ffmpeg" "ffmpeg"


#==================================
# Install Snap packages
#==================================
print_title "Install Snap Packages"
snap_install "GitKraken" "gitkraken"
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
# Custom Packages
#==================================
print_title "Install Custom Packages"

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" &> /dev/null
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
print_success "lazygit"



