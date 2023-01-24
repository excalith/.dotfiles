set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/bindings.fish
. $fish_path/local.fish

funcsave fcd >/dev/null
funcsave mkcd >/dev/null
funcsave pping >/dev/null
funcsave supdate >/dev/null
funcsave flushdns >/dev/null



# Source starship
starship init fish | source
