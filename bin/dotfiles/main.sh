#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


dotfiles_main() {
	print_title "Select an option"
	print_option "1" "Open Directory"
	print_option "2" "Compare Changes"
	print_option "3" "Launch In Editor"
	print_option "8" "Config"
	print_option "9" "Help"
	print_option "0" "Exit"
	print_question "Selection: "

	read -r opt
	case $opt in
	1)
		open_dir ".dotfiles"
		exit 0
		;;
	2)
		cd ~/.dotfiles
		git diff --name-only | fzf -m --ansi --preview "git diff --color=always -- {-1}"
		git status --name-only | fzf -m --ansi --preview "git status --color=always -- {-1}"
		exit 0
		;;
	3)
		code .
		exit 0
		;;
	8)
		bash ~/.dotfiles/bin/dotfiles/config.sh
		exit 0
		;;
	9)
		bash ~/.dotfiles/bin/dotfiles/help.sh
		exit 0
		;;
	0)
		print_success "Bye"
		exit 0
		;;
	*)
		print_error "Wrong option: $ans"
		exit 1
		;;
	esac
}

main() {
	print_section "Excalih Dotfiles"

	dotfiles_main
}

main
