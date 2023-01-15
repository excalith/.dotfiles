#!/bin/bash

#==================================
# Settings
#==================================
declare dotfilesDirectory="$HOME/.dotfiles"
declare MINIMUM_MACOS_VERSION="10.10"
declare MINIMUM_UBUNTU_VERSION="20.04"

#==================================
# Variables
#==================================
declare GITHUB_REPOSITORY="excalith/.dotfiles-new"
declare DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/os/utils.sh"

#==================================
# Helper Functions
#==================================
download() {
    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then
        curl \
            --location \
            --silent \
            --show-error \
            --output "$output" \
            "$url" \
                &> /dev/null

        return $?

    elif command -v "wget" &> /dev/null; then
        wget \
            --quiet \
            --output-document="$output" \
            "$url" \
                &> /dev/null

        return $?
    fi

    return 1
}

download_dotfiles() {
    local tmpFile=""

    print_title "Download and extract archive"
    tmpFile="$(mktemp /tmp/XXXXX)"

    download "$DOTFILES_TARBALL_URL" "$tmpFile"
    print_result $? "Download archive" "true"
    printf "\n"

    mkdir -p "$dotfilesDirectory"
    print_result $? "Create '$dotfilesDirectory'" "true"


    # Extract archive in the `dotfiles` directory.
    extract "$tmpFile" "$dotfilesDirectory"
    print_result $? "Extract archive" "true"

    rm -rf "$tmpFile"
    print_result $? "Remove archive"
}

extract() {
    local archive="$1"
    local outputDir="$2"

    if command -v "tar" &> /dev/null; then
        tar \
            --extract \
            --gzip \
            --file "$archive" \
            --strip-components 1 \
            --directory "$outputDir"

        return $?
    fi

    return 1
}

verify_os() {
    local os_name="$(get_os)"
    local os_version="$(get_os_version)"

    # Check if the OS is `macOS` and supported
    if [ "$os_name" == "macos" ]; then
        if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
        fi

    # Check if the OS is `Ubuntu` and supported
    elif [ "$os_name" == "ubuntu" ]; then

        if is_supported_version "$os_version" "$MINIMUM_UBUNTU_VERSION"; then
            return 0
        else
            printf "Sorry, this script is intended only for Ubuntu %s+" "$MINIMUM_UBUNTU_VERSION"
        fi
    
    # Exit if not supported OS
    else
        printf "Sorry, OS $os_name is not supported. This script is intended only for macOS and Ubuntu!"
    fi

    return 1
}
#==================================
# Main Install Starter
#==================================
main() {

    # Ensure that the following actions are made relative to this file's path.
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

    # Load utils
    if [ -x "utils.sh" ]; then
        . "utils.sh" || exit 1
    else
        download_utils || exit 1
    fi


    # Verify OS and OS version
    verify_os || exit 1

    # Ask user for sudo
    ask_for_sudo

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.
    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    # Start installation
    cd "../system/$(get_os)"
    . "install.sh"

    # Link to original repository
    if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
        . ~/.dotfiles/scripts/utils/init_dotfile_repo.sh "$DOTFILES_ORIGIN"
    fi

    # Ask for restart
    . ~/.dotfiles/scripts/utils/restart.sh
}

main "$@"
