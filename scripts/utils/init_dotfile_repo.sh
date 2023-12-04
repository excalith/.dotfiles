#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


initialize_git_repository() {
    declare -r GIT_ORIGIN="$1"

    if [ -z "$GIT_ORIGIN" ]; then
        print_error "Please provide a URL for the Git origin"
        exit 1
    fi

    # Check repository already initialized
    if ! is_git_repository; then
        # Run the following Git commands in the root of
        # the dotfiles directory, not in the `os/` directory.
        cd ../../ \
            || print_error "Failed to 'cd ../../'"

        execute \
            "git init && git remote add origin $GIT_ORIGIN" \
            "Initialize git repository"
    fi
}

main() {
    print_section "Initialize Git Repository"
    initialize_git_repository "$1"
}

main "$1"
