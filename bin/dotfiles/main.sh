#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


df_main() {
	OPT_1="Directory..."
	OPT_2="Edit..."
	OPT_3="Generate..."
	OPT_4="Help"
	OPT_0="Exit"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_4" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		df_sub_dir
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		df_sub_edit
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		df_sub_generate
	elif  [ "$CHOICE" == "$OPT_4" ]; then
		df_sub_help
	elif  [ "$CHOICE" == "$OPT_0" ]; then
		print_in_green "  Bye!\n"
		exit 0
	fi
}

df_sub_dir() {
	OPT_1="Open Directory"
	OPT_2="CD Directory"
	OPT_0="Back"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		printf "  Opening .dotfiles directory\n"
		open_dir "$HOME/.dotfiles"
		exit 0
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		cd "$HOME/.dotfiles" || exit
	elif  [ "$CHOICE" == "$OPT_0" ]; then
			df_main
	fi
}

df_sub_edit() {
	OPT_1="Compare Changes"
	OPT_2="Launch In Editor"
	OPT_0="Back"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		printf "  Comparing config changes with upstream\n"
		current_dir=$(pwd)
		cd ~/.dotfiles && \
fish <<'END_FISH'
	gd
END_FISH
		cd "$current_dir" || exit
		exit 0
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		printf "  Launching .dotfiles project in code editor\n"
		code ~/.dotfiles
		exit 0
	elif  [ "$CHOICE" == "$OPT_0" ]; then
			df_main
	fi
}

df_sub_generate() {
	OPT_1="Generate Symlinks"
	OPT_2="Generate SSH"
	OPT_3="Generate GPG"
	OPT_0="Back"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")

	if [ "$CHOICE" == "$OPT_1" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			bash ~/.dotfiles/system/symlink.sh
		else
			df_sub_generate
		fi
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			bash ~/.dotfiles/scripts/utils/generate_ssh.sh "--skip"
		else
			df_sub_generate
		fi
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		gum confirm "Do You Want To $CHOICE?"
		if [ $? -eq 0 ]; then
			bash ~/.dotfiles/scripts/utils/generate_gpg.sh "--skip"
		else
			df_sub_generate
		fi
	elif  [ "$CHOICE" == "$OPT_0" ]; then
			df_main
	fi
}

df_sub_help() {
	OPT_1="Terminal"
	OPT_2="NeoVim"
	OPT_3="Yabai / SKHD"
	OPT_0="Back"

	os_name="$(get_os)"
	if [ "$os_name" == "macos" ]; then
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")
	elif [ "$os_name" == "ubuntu" ]; then
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")
	else
		CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")
	fi

	if [ "$CHOICE" == "$OPT_1" ]; then
		cat < ~/.dotfiles/bin/dotfiles/terminal.txt | gum filter
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		cat < ~/.dotfiles/bin/dotfiles/neovim.txt | gum filter
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		cat < ~/.dotfiles/bin/dotfiles/yabai.txt | gum filter
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
