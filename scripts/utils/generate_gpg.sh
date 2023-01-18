#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"

generate_gpg_key() {
    # Read required information
    ask "GPG Username: "
    local gpg_name="$(get_answer)"

    ask "GPG E-Mail  : "
    local gpg_mail="$(get_answer)"

    # Generate gpg keys
    gpg --quick-generate-key "$gpg_name <$gpg_mail>" rsa4096 cert never
}

register_to_shell() {
    if cmd_exists "bash"; then
        echo 'export GPG_TTY=$(tty)' >> ~/.config/bash/.bash.local
    fi

    if cmd_exists "zsh"; then
        echo 'export GPG_TTY=$(tty)' >> ~/.zsh.local
    fi

    if cmd_exists "fish"; then
        echo 'set -gx GPG_TTY (tty)' >> ~/.config/fish/fish.local
    fi
}

export_gpg() {
    # Read GPG ID
    local gpgId=gpg --list-secret-keys --with-colons 2> /dev/null \
            | grep '^sec:' | cut --delimiter ':' --fields 5

    # Add GPG ID to git config
    echo "	signingkey = '$gpgId'" >> ~/.config/git/config.local

    # Add GPG Sign function to commit
    printf "[commit]\n	gpgsign = true" >> ~/.config/git/config.local

    # Copy GPG Key to clipboard
    if cmd_exists "pbcopy"; then
        gpg --armor --export $gpgId | pbcopy | echo 'GPG Public Key copied to pasteboard.'
    elif cmd_exists "xclip"; then
        gpg --armor --export $gpgId | xclip | echo 'GPG Public Key copied to pasteboard.'
    else
        print_warning "Please copy your GPG key with 'gpg --armor --export $gpgId' command"
    fi
}


main() {
	print_section "GPG Setup"

    ask_for_confirmation "Do you want to setup GPG?"
    printf "\n"

    if answer_is_yes; then
        generate_gpg_key
        register_to_shell
        export_gpg
    else
        print_warning "Skipped GPG setup"
    fi
}

main











#==================================
# GPG Keys
#==================================
read -p "$(tput setaf 10)[3/3]$(tput sgr0) Would you like to generate new GPG Keys (y/N)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then

    # Print instructions for gpg
    echo
    echo "$(tput setaf 10)────────────────────────────────────────$(tput sgr0)"
    echo "$(tput setaf 10)GPG Username: $(tput sgr0)$gpg_name"
    echo "$(tput setaf 10)GPG E-Mail  : $(tput sgr0)$gpg_mail"
    echo "$(tput setaf 10)GPG ID      : $(tput sgr0) $gpgId"
    echo
    echo "Follow instructions below:"
    echo "$(tput setaf 10)1. $(tput sgr0)Enter 'gpg> adduid' command"
    echo "$(tput setaf 10)2. $(tput sgr0)Fill your information with these"
    echo "      $(tput sgr0)Real Name: $gpg_name"
    echo "      $(tput sgr0)Email address: $gpg_mail"
    echo "      $(tput sgr0)Comment: [Optional]"
    echo "$(tput setaf 10)3. $(tput sgr0)Enter 'O' to confirm your selection"
    echo "$(tput setaf 10)4. $(tput sgr0)Enter your key's passphrase"
    echo "$(tput setaf 10)5. $(tput sgr0)Enter 'gpg> save' to save changes"
    echo "$(tput setaf 10)────────────────────────────────────────$(tput sgr0)"
    echo

    # Edit key to associate with user mail
    gpg --edit-key "$gpgId"

    echo "GPG keys generated for $gpg_name <$gpg_mail>"

    # Export gpg key to clipboard
    if command -v pbcopy &>/dev/null; then
        gpg --armor --export $gpgId | pbcopy | echo 'GPG Public Key copied to pasteboard.'
    elif command -v xclip &>/dev/null; then
        gpg --armor --export $gpgId | xclip |  echo 'GPG Public Key copied to pasteboard.'
    else
        echo "Please manually copy your GPG key with 'gpg --armor --export ID' command"
    fi
fi
