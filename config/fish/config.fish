set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. ~/.config/bash/aliases.bash
. $fish_path/export.fish
. $fish_path/bindings.fish
. $fish_path/local.fish

funcsave fcd >/dev/null
funcsave mkcd >/dev/null
funcsave pping >/dev/null
funcsave flushdns >/dev/null
funcsave sreload >/dev/null
funcsave treload >/dev/null
funcsave supdate >/dev/null
funcsave pupdate >/dev/null
funcsave arasaka >/dev/null

alias ping pping

# Source starship
starship init fish | source
