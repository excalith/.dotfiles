#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


is_git_repository() {
    git rev-parse &> /dev/null
}


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

    # Try to connect to repository
    ask_for_confirmation "GitHub SSH is required for pulling dotfiles content. Did you setup your GitHub SSH Key?"
    if answer_is_yes; then

        ssh -T git@github.com &> /dev/null
        if [ $? -ne 1 ]; then
            print_title "Update dotfiles"
            ask_for_confirmation "Do you want to update the content of dotfiles from repository?"

            if answer_is_yes; then
                git fetch --all 1> /dev/null \
                    && git reset --hard origin/main 1> /dev/null \
                    && git checkout main &> /dev/null \
                    && git clean -fd 1> /dev/null

                print_result $? "Update dotfiles content"
            fi
        else
            print_warning "Github rejected connection. You may want to check your SSH configuration."    
        fi
    else
        print_warning "Cannot update dotfiles content without GitHub SSH setup."    
    fi
}

main() {
    print_section "Initialize Git Repository"
    initialize_git_repository "$1"
}

main "$1"
