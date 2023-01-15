set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/bindings.fish

if status is-interactive
and not set -q TMUX
    exec tmux
end

funcsave mkcd >/dev/null
funcsave ping_pretty >/dev/null
funcsave fcd >/dev/null

# Source starship
starship init fish | source
