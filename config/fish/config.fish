set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. $fish_path/aliases.fish
. $fish_path/export.fish

if status is-interactive and not set -q TMUX
    exec tmux
end

starship init fish | source