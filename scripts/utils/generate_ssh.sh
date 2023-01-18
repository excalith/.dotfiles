#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"

setup() {
    # Each host should have one ssh key for identifying itself
    # So that if something happens to that host, we can revoke that key
    # instead of revoking all keys within that host
    local sshKeyFileName="$HOME/.ssh/dotfiles_$(uname)"

    # If there is already a file with that
    # name, generate another, unique, file name.
    if [ -f "$sshKeyFileName" ]; then
        sshKeyFileName="$(mktemp -u "$HOME/.ssh/dotfiles_$(uname)_XXXXX")"
    fi

    # Start generating
    generate_ssh_key "$sshKeyFileName"
    add_ssh_configs "$sshKeyFileName"
    copy_pubkey "${sshKeyFileName}.pub"
}

generate_ssh_key() {
    print_title "Generate SSH Key"
    ask "SSH Credential E-Mail: "
    printf "\n"
    ssh-keygen -t ed25519 -C "$(get_answer)" -f "$1"

    print_result $? "Generate SSH keys (ed25519)"
}

add_ssh_configs() {
    print_title "Add SSH Configs"
    local os="$(uname)"

    # Check if the OS is Darwin (macOS)
    if [ "$os" == "Darwin" ]; then
        printf "%s\n" \
            "Host *" \
            "  AddKeysToAgent yes" \
            "  UseKeychain yes" \
            "  IdentityFile $1" \
            "  LogLevel ERROR" >> ~/.ssh/config

    # Check if the OS is Linux
    elif [ "$os" == "Linux" ]; then
        printf "%s\n" \
            "Host *" \
            "  IdentityFile $1" \
            "  LogLevel ERROR" >> ~/.ssh/config
    
    # Exit if not supported OS
    else
        print_error "Could not create SSH config for $os"
    fi

    print_result $? "Add SSH configs"
}

copy_pubkey () {
    print_title "Public Key Management"

    if cmd_exists "pbcopy"; then
        pbcopy < "$1"
        print_result $? "Copy public SSH key to clipboard"

    elif cmd_exists "xclip"; then
        xclip -selection clip < "$1"
        print_result $? "Copy public SSH key to clipboard"

    else
        print_warning "Please copy the public SSH key ($1) to clipboard"
    fi
}

main() {
	print_section "SSH Setup"

    ask_for_confirmation "Do you want to setup SSH?"
    printf "\n"

    if answer_is_yes; then
        ssh -T git@github.com &> /dev/null

        if [ $? -ne 1 ]; then
            setup
        fi
    else	
		print_warning "Skipped SSH setup"
	fi
}

main
