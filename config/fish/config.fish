set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. ~/.config/bash/aliases.bash
. $fish_path/export.fish
. $fish_path/bindings.fish
. $fish_path/local.fish

# Functions
funcsave fcd >/dev/null
funcsave mkcd >/dev/null
funcsave c_prettyping >/dev/null
funcsave c_mtr >/dev/null
funcsave flushdns >/dev/null
funcsave ql >/dev/null
funcsave sreload >/dev/null
funcsave treload >/dev/null
funcsave supdate >/dev/null
funcsave pupdate >/dev/null
funcsave arasaka >/dev/null

# Aliases
alias ping c_prettyping
alias traceroute c_mtr

# Check if the machine is running on Windows WSL
if test (grep -qi Microsoft /proc/version)
    # Add HDD aliases for WSL cd into mounted drives
    alias C "cd /mnt/c"
    alias D "cd /mnt/d"
end

# Source starship
starship init fish | source
