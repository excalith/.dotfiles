#!/bin/bash

echo "$(tput setaf 10)┌─────────────────────────────────┐$(tput sgr0)"
echo "$(tput setaf 10)│   Running MacOS Dotfile Setup   │$(tput sgr0)"
echo "$(tput setaf 10)└─────────────────────────────────┘$(tput sgr0)"
echo

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh" \
    && . "../../scripts/utils/utils_macos.sh"


cd "../../system/macos"

# setup xcode
. ~/.dotfiles/system/macos/setup_xcode.sh

# setup packages
. ~/.dotfiles/system/macos/setup_packages.sh

# setup shell
. ~/.dotfiles/system/macos/setup_shell.sh

# setup symlinks
. ~/.dotfiles/system/macos/setup_symlinks.sh

# setup defaults
. ~/.dotfiles/system/macos/setup_defaults.sh