#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"


main() {
    print_title "Restart"

    ask_for_confirmation "Do you want to restart?"
    printf "\n"

    if answer_is_yes; then
        sudo shutdown -r now &> /dev/null
    fi
 }

 main
