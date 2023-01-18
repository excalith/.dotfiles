#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


main() {
	print_section "Git Credentials"

    ask_for_confirmation "Do you want to update Git Credentials?"
    printf "\n"

    if answer_is_yes; then
	    ask "Git Username: "
		local username="$(get_answer)"

	    ask "Git E-Mail  : "
		local email="$(get_answer)"

        touch ~/.config/git/config.local
        echo "[user]
    	name = $username
    	email = $email" >~/.config/git/config.local

		printf "\n"
		print_result $? "Generate git credentials"
    else	
		print_warning "Skipped git credentials setup"
	fi
 }

 main
