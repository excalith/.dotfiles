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
print_section "Installing Packages"


#==================================
# Add keys to apt
#==================================
print_title "Adding Keys"

# Mono
sudo mkdir -p /etc/apt/keyrings
execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" "Mono (Add Key)"

# Charm
curl -fsSL --silent https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg &> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list &> /dev/null

#==================================
# Add repositories to apt
#==================================
print_title "Adding Repositories"
apt_add_repo "Universe" "universe"
apt_add_repo "Multiverse" "multiverse"
apt_add_repo "Fish" "ppa:fish-shell/release-3"
apt_add_repo "Alacritty" "ppa:aslatter/ppa"


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
apt_install "Gnome Shell Extensions" "gnome-shell-extensions"
apt_install "Gnome Shell Extension Manager" "gnome-shell-extension-manager"
apt_install "Gnome Tweaks" "gnome-tweaks"

apt_install "heif-gdk-pixbuf" "heif-gdk-pixbuf"
apt_install "heif-thumbnailer" "heif-thumbnailer"

apt_install "gnupg" "gnupg"
apt_install "gpg" "gpg"
apt_install "ca-certificates" "ca-certificates"
apt_install "dirmngr" "dirmngr"
apt_install "curl" "curl"
apt_install "wget" "wget"
apt_install "pyhton3" "python3"
apt_install "git" "git"
apt_install "git-all" "git-all"
apt_install "git-lfs" "git-lfs"
apt_install "apt-transport-https" "apt-transport-https"
apt_install "software-properties-common" "software-properties-common"
apt_install "libgconf-2-4" "libgconf-2-4"

apt_install "tmux" "tmux"
apt_install "less" "less"
apt_install "exa" "exa"
apt_install "bat" "bat"
apt_install "tre-command" "tre-command"
apt_install "fasd" "fasd"
apt_install "fd-find" "fd-find"
apt_install "fzf" "fzf"
apt_install "ripgrep" "ripgrep"

apt_install "gum" "gum"
apt_install "htop" "htop"
apt_install "httpie" "httpie"
apt_install "prettyping" "prettyping"

apt_install "tldr" "tldr"
apt_install "neofetch" "neofetch"

apt_install "midnight-commander" "mc"
apt_install "node" "nodejs"
apt_install "yarn" "yarn"
apt_install "gcc" "gcc"
apt_install "neovim" "neovim"
apt_install "ffmpeg" "ffmpeg"

apt_install "nudoku" "nudoku"

apt_install "Alacritty" "alacritty"
apt_install "Caffeine" "caffeine"
apt_install "Notion" "notion"


#==================================
# Install Snap packages
#==================================
print_title "Install Snap Packages"
snap_install "spt" "spt"
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
# Install From Source
#==================================
print_title "Install Packages From Source"

# Tmux Plugin Manager (TPM)
execute "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" "TMUX Plugin Manager (TPM)"

# # Kitty
# curl -L --silent https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
# sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

# LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz --silent --output /dev/null "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz
print_success "lazygit"

# NvChad
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
execute "git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1" "NvChad"

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
