#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


df_main() {
	OPT_1="Open Directory"
	OPT_2="Compare Changes"
	OPT_3="Launch In Editor"
	OPT_4="Maintenance"
	OPT_5="Help"
	OPT_0="Exit"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_4" "$OPT_5" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		printf "  Opening .dotfiles directory\n"
		open_dir "$HOME/.dotfiles"
		exit 0
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		printf "  Comparing config changes with upstream\n"
		exit 0
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		printf "  Launching .dotfiles project in code editor\n"
		code ~/.dotfiles
		exit 0
	elif  [ "$CHOICE" == "$OPT_4" ]; then
		df_maintenance
	elif  [ "$CHOICE" == "$OPT_5" ]; then
		df_help
	elif  [ "$CHOICE" == "$OPT_0" ]; then
		print_in_green "  Bye!\n"
		exit 0
	fi
}

df_maintenance() {
	OPT_1="Run Symlink"
	OPT_2="Generate SSH"
	OPT_3="Generate GPG"
	OPT_0="Back"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			os_name="$(get_os)"
			if [ "$os_name" == "macos" ]; then
				bash ~/.dotfiles/system/macos/setup_symlinks.sh
			elif [ "$os_name" == "ubuntu" ]; then
				bash ~/.dotfiles/system/ubuntu/setup_symlinks.sh
			else
				print_error "$os_name is not supported."
				main
			fi
		else
			df_maintenance
		fi
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			bash ~/.dotfiles/scripts/utils/generate_ssh.sh
		else
			df_maintenance
		fi
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			bash ~/.dotfiles/scripts/utils/generate_gpg.sh
		else
			df_maintenance
		fi
	elif  [ "$CHOICE" == "$OPT_0" ]; then
			df_main
	fi
}

df_help() {
	OPT_1="Terminal"
	OPT_2="NeoVim"
	OPT_3="Yabai / SKHD"
	OPT_0="Back"

	os_name="$(get_os)"
	if [ "$os_name" == "maos" ]; then
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")
	elif [ "$os_name" == "ubuntu" ]; then
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")
	else
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")
	fi

	if [ "$CHOICE" == "$OPT_1" ]; then
		cat < terminal.txt | gum filter
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		cat < neovim.txt | gum filter
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		cat < yabai.txt | gum filter
	elif  [ "$CHOICE" == "$OPT_0" ]; then
		df_main
	fi
}

main () {
gum style \
	--foreground 212 --border-foreground 212 --border rounded \
	--align center --width 40 --margin "0 0" --padding "0 0" \
	'Excalith Dotfiles' 'Maintenance'

	print_in_green "\n  Select an option\n"
	df_main
}

main
