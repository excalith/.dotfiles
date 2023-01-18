#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"

generate_gpg_key() {
    ask "GPG Username: "
    local gpg_name="$(get_answer)"

    ask "GPG E-Mail  : "
    local gpg_mail="$(get_answer)"

    # Generate gpg keys
    gpg --quick-generate-key "$gpg_name ($uname) <$gpg_mail>" rsa4096 default never
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
    gpgId=$(gpg --list-secret-keys --with-colons | grep '^sec:' | cut --delimiter ':' --fields 5)

    # Add GPG ID to git config
    echo "	signingkey = $gpgId" >> ~/.config/git/config.local

    # Add GPG Sign function to commit
    printf "[commit]\n	gpgsign = true\n[gpg]\n	program = gpg" >> ~/.config/git/config.local

    # Copy GPG Key to clipboard
    if cmd_exists "pbcopy"; then
        gpg --armor --export $gpgId | pbcopy
        print_result $? "GPG Public Key copied to pasteboard."
    elif cmd_exists "xclip"; then
        gpg --armor --export $gpgId | xclip -sel clip
        print_result $? "GPG Public Key copied to pasteboard."
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