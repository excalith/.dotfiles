#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


gi_select_file() {
	OPT_1="Unity 3D"
	OPT_2="Unreal Engine"
	OPT_3="Node"
	OPT_0="Exit"
	CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")

    if  [ "$CHOICE" == "$OPT_0" ]; then
		print_in_green "  Bye!\n"
		exit 0
    elif [ -f "./.gitignore" ]; then
        gum confirm "Do You Want To Override Existing .gitignore?"
		if [ $? -eq 1 ]; then
			gi_select_file
		fi
    fi

	if [ "$CHOICE" == "$OPT_1" ]; then
		print_in_green "  Copied Unity3D .gitignore template to project\n"
        cp ~/.dotfiles/bin/gitignore/templates/.gitignore_unity ./.gitignore
		exit 0
	elif  [ "$CHOICE" == "$OPT_2" ]; then
		print_in_green "  Copied Unreal Engine .gitignore template to project\n"
        cp ~/.dotfiles/bin/gitignore/templates/.gitignore_unreal ./.gitignore
		exit 0
	elif  [ "$CHOICE" == "$OPT_3" ]; then
		print_in_green "  Copied Node .gitignore template to project\n"
        cp ~/.dotfiles/bin/gitignore/templates/.gitignore_node ./.gitignore
		exit 0
    fi
}

main () {
    gum style \
        --foreground 212 --border-foreground 212 --border rounded \
        --align center --width 40 --margin "0 0" --padding "0 0" \
        'Create Gitignore File'

    if [ ! -d "./.git" ]; then
        echo "  $(tput setaf 5)Not a git repository"
    else
        print_in_green "\n  Select an option\n"
        gi_select_file
    fi
}

main