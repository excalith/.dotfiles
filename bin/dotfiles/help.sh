#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"


terminal_help() {
    echo "$(tput setaf 236)┌─────────────────────────────────────────────────────────────┐"
    echo "$(tput setaf 236)│                   $(tput setaf 220)TERMINAL KEY BINDINGS                     $(tput setaf 236)│"
    echo "$(tput setaf 236)├────────────────────────┬────────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 220)Key Binding            $(tput setaf 236)│ $(tput setaf 220)Description                        $(tput setaf 236)│"
    echo "$(tput setaf 236)├────────────────────────┼────────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)q$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Quit Alacritty                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)w$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Close Tab/Pane                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)F11$(tput setaf 220)]$(tput setaf 15)                  $(tput setaf 236)│$(tput setaf 15) Fullscreen                         $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CTRL$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)A$(tput setaf 220)] + $(tput setaf 220)[$(tput setaf 15)TAB$(tput setaf 220)]$(tput setaf 15)   $(tput setaf 236)│$(tput setaf 15) Show Directory Panel               $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)t$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Open New Tab                       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)s$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Select Tab                         $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Key 1$(tput setaf 236)...$(tput setaf 15)9$(tput setaf 220)]$(tput setaf 15)    $(tput setaf 236)│$(tput setaf 15) Switch Tabs                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)j$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Split Pane Vertical                $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)k$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Split Pane Horizontal              $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)d$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Select Pane                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)F12$(tput setaf 220)]                  $(tput setaf 236)│$(tput setaf 15) Focus Selected Pane                $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Left$(tput setaf 220)]$(tput setaf 15)         $(tput setaf 236)│$(tput setaf 15) Jump To Line Beggining             $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Right$(tput setaf 220)]$(tput setaf 15)        $(tput setaf 236)│$(tput setaf 15) Jump To Line End                   $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Up$(tput setaf 220)]$(tput setaf 15)           $(tput setaf 236)│$(tput setaf 15) Previous Command                   $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Down$(tput setaf 220)]$(tput setaf 15)         $(tput setaf 236)│$(tput setaf 15) Next Command                       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Backspace$(tput setaf 220)]$(tput setaf 15)    $(tput setaf 236)│$(tput setaf 15) Delete Line                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)r$(tput setaf 220)]$(tput setaf 15)            $(tput setaf 236)│$(tput setaf 15) Reload tmux configuration          $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)CMD$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)Shift$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)r$(tput setaf 220)]$(tput setaf 15)  $(tput setaf 236)│$(tput setaf 15) Kill tmux server                   $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)j$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)INPUT$(tput setaf 220)]$(tput setaf 15)          $(tput setaf 236)│$(tput setaf 15) Auto-jump to directory             $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)fd$(tput setaf 220)]$(tput setaf 15)                   $(tput setaf 236)│$(tput setaf 15) Fuzzy-Find a directory             $(tput setaf 236)│"
    echo "$(tput setaf 236)└────────────────────────┴────────────────────────────────────┘"
}

neovim_help()
{
    echo "$(tput setaf 236)┌─────────────────────────────────────────────────────────────┐"
    echo "$(tput setaf 236)│                     $(tput setaf 220)NEOVIM KEY BINDINGS                     $(tput setaf 236)│"
    echo "$(tput setaf 236)├────────────────────────┬────────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 220)Map                    $(tput setaf 236)│ $(tput setaf 220)Description                        $(tput setaf 236)│"
    echo "$(tput setaf 236)├────────────────────────┼────────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 15)Space                  $(tput setaf 236)│ $(tput setaf 15)Leader Key                         $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 15)i$(tput setaf 236)                      │ $(tput setaf 15)Insert Mode                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15):$(tput setaf 236)                      │ $(tput setaf 15)Command Mode                       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)R$(tput setaf 236)                      │ $(tput setaf 15)Replace Mode                       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)v$(tput setaf 236)                      │ $(tput setaf 15)Visual Mode (Highlighting)         $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)V$(tput setaf 236)                      │ $(tput setaf 15)Visual Mode (Highlighting Line)    $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)esc$(tput setaf 236)                    │ $(tput setaf 15)Return To Normal Mode              $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 15)w                      $(tput setaf 236)│ $(tput setaf 15)Next Word                          $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)b                      $(tput setaf 236)│ $(tput setaf 15)Previous Word                      $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)P                      $(tput setaf 236)│ $(tput setaf 15)Paste Before                       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)p                      $(tput setaf 236)│ $(tput setaf 15)Paste After                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 15)J                      $(tput setaf 236)│ $(tput setaf 15)Join Lines                         $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)dd                     $(tput setaf 236)│ $(tput setaf 15)Delete Line                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)x                      $(tput setaf 236)│ $(tput setaf 15)Delete Char                        $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15)X                      $(tput setaf 236)│ $(tput setaf 15)Delete Char (Backspace)            $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 15)u                      $(tput setaf 236)│ $(tput setaf 15)Undo                               $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 15): $(tput setaf 220)<$(tput setaf 15)number$(tput setaf 220)>$(tput setaf 15)             $(tput setaf 236)│ $(tput setaf 15)Go To Line <number>                $(tput setaf 236)│"
    echo "$(tput setaf 236)│                        │                                    │"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)/              $(tput setaf 236)│ $(tput setaf 15)Comment                            $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)Tab            $(tput setaf 236)│ $(tput setaf 15)Tree                               $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)fw             $(tput setaf 236)│ $(tput setaf 15)Telescope Grep                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)ff             $(tput setaf 236)│ $(tput setaf 15)Telescope Files                    $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)zz             $(tput setaf 236)│ $(tput setaf 15)Atraxis                            $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)zf             $(tput setaf 236)│ $(tput setaf 15)Focus                              $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)<$(tput setaf 15)leader$(tput setaf 220)>$(tput setaf 15)zm             $(tput setaf 236)│ $(tput setaf 15)Minimalist                         $(tput setaf 236)│"
    echo "$(tput setaf 236)└────────────────────────┴────────────────────────────────────┘"
}

wm_bindings_help()
{
    echo "$(tput setaf 236)┌─────────────────────────────────────────────────────────────┐"
    echo "$(tput setaf 236)│                 $(tput setaf 220)YABAI-SKHD KEY BINDINGS                     $(tput setaf 236)│"
    echo "$(tput setaf 236)├───────────────────────────┬─────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 220)Key                       $(tput setaf 236)│ $(tput setaf 220)Description                     $(tput setaf 236)│"
    echo "$(tput setaf 236)├───────────────────────────┼─────────────────────────────────┤"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)SHIFT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)1...5$(tput setaf 220)]$(tput setaf 15) $(tput setaf 236)│ $(tput setaf 15)Move focus between spaces       $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)1...5$(tput setaf 220)]$(tput setaf 15)           $(tput setaf 236)│ $(tput setaf 15)Move window and focus space     $(tput setaf 236)│"
    echo "$(tput setaf 236)│                           │                                 │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)h$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Focus west                      $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)j$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Focus south                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)k$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Focus north                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)l$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Focus east                      $(tput setaf 236)│"
    echo "$(tput setaf 236)│                           │                                 │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)z$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Toggle fullscreen               $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)f$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Toggle native fullscreen        $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)x$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Toggle float                    $(tput setaf 236)│"
    echo "$(tput setaf 236)│                           │                                 │"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)r$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Rotate tree                     $(tput setaf 236)│"
    echo "$(tput setaf 236)│ $(tput setaf 220)[$(tput setaf 15)ALT$(tput setaf 220)]$(tput setaf 15) + $(tput setaf 220)[$(tput setaf 15)c$(tput setaf 220)]$(tput setaf 15)               $(tput setaf 236)│ $(tput setaf 15)Balance window sizes            $(tput setaf 236)│"
    echo "$(tput setaf 236)└────────────────────────┴────────────────────────────────────┘"
}

main() {
	print_section "Excalih Dotfiles Help"
	print_option "1" "Alacritty / Kitty"
	print_option "2" "NeoVim"
	print_option "3" "Yabai / SKHD"
	print_option "0" "Exit\n"
	print_question "Choose an option: "

    read -r ans
    case $ans in
    1)
		terminal_help
        exit 0
        ;;
    2)
		neovim_help
        exit 0
        ;;
    3)
		wm_bindings_help
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