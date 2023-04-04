#!/bin/bash

#==================================
# SOURCE UTILS
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"


#==================================
# PACMAN
#==================================
pacman_install() {
    declare -r EXTRA_ARGUMENTS="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! pacman_installed "$PACKAGE"; then
        execute "sudo pacman -S --noconfirm --needed $EXTRA_ARGUMENTS $PACKAGE" "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi
}

pacman_update() {
    execute \
        "sudo pacman -Syyu" \
        "Pacman Update"
}

pacman_installed() {
    pacman -Q "$1" &> /dev/null
}

aur_install() {
	declare -r PACKAGE="$2"
	declare -r PACKAGE_READABLE_NAME="$1"

	if ! pacman_installed "$PACKAGE"; then
		execute "aura -Acax --noconfirm $PACKAGE" "$PACKAGE_READABLE_NAME"
	else
		print_success "$PACKAGE_READABLE_NAME"
	fi
}

#==================================
# SNAP
#==================================
snap_install() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! snap_installed "$PACKAGE"; then
        execute "sudo snap install --classic $PACKAGE" "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi
}

snap_installed() {
    snap list --all | grep -i "$1" &> /dev/null
}


#==================================
# FLATPAK
#==================================
flatpak_install() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! flatpak_installed "$PACKAGE"; then
        execute "flatpak install -y flathub $PACKAGE" "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi
}

flatpak_installed() {
    flatpak list --columns=name,application | grep -i "$1" &> /dev/null
}


#==================================
# FISHER
#==================================
fisher_install() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    fish -c "fisher install $PACKAGE" &> /dev/null
    print_result $? "$PACKAGE_READABLE_NAME" "true"
}


#==================================
# GNOME EXTENSION
#==================================
extension_install()
{
   EXTENSION_ID=$(curl -s --silent $2 | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs --silent "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -qO ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip  &> /dev/null
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
     gnome-extensions enable ${EXTENSION_ID}
     print_result $? "$1"
    rm ${EXTENSION_ID}.zip
}
