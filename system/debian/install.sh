#!/bin/bash

echo "$(tput setaf 10)┌─────────────────────────────────┐$(tput sgr0)"
echo "$(tput setaf 10)│   Running Linux Dotfile Setup   │$(tput sgr0)"
echo "$(tput setaf 10)└─────────────────────────────────┘$(tput sgr0)"
echo

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../scripts/utils/utils.sh" \
    && . "../../scripts/utils/utils_debian.sh"


cd "../../system/debian"

# setup packages
. ~/.dotfiles/system/debian/setup_packages.sh

# setup fonts
. ~/.dotfiles/system/debian/setup_fonts.sh

# setup shell
. ~/.dotfiles/system/debian/setup_shell.sh

# setup symlinks
. ~/.dotfiles/system/debian/setup_symlinks.sh

# setup defaults
. ~/.dotfiles/system/debian/setup_defaults.sh