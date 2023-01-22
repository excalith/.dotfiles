#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


main() {
	print_title "Select an option"
	print_option "1" "Run Symlink"
	print_option "2" "Generate SSH"
	print_option "3" "Generate GPG"
	print_option "0" "Back"
	print_question "Selection: "

	read -r opt
	case $opt in
	1)
		os_name="$(get_os)"

		if [ "$os_name" == "macos" ]; then
			bash ~/.dotfiles/system/macos/setup_symlinks.sh
		elif [ "$os_name" == "ubuntu" ]; then
			bash ~/.dotfiles/system/ubuntu/setup_symlinks.sh
		else
			print_error "$os_name is not supported."
			main
		fi
		exit 0
		;;
	2)
		bash ~/.dotfiles/scripts/utils/generate_ssh.sh
		exit 0
		;;
	3)
		bash ~/.dotfiles/scripts/utils/generate_gpg.sh
		exit 0
		;;
	0)
		bash ~/.dotfiles/bin/dotfiles/main.sh
		exit 0
		;;
	*)
		print_error "Wrong option: $ans"
		exit 1
		;;
	esac
}

main