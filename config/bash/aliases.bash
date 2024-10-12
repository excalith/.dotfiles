# Run dotfiles bin
alias dotfiles="bash ~/.dotfiles/bin/dotfiles/main.sh"
alias colors="bash ~/.dotfiles/bin/colors/colors.sh"

# Command replacements
alias exa='command eza --group-directories-first -laho --no-user --icons --git --git-repos --time-style relative'
alias cat=bat
alias man=batman
alias lg=lazygit
alias matrix='cmatrix -aBf'
alias fast='fast -u --single-line'

alias ping='c_prettyping'
alias traceroute='c_mtr'

# History
alias h="history -15"    # last 10 history commands
alias hc="history -c"    # clear history
alias hg="history | rg " # +command

# SSH Public Keys
alias sshpubkey="pbcopy < ~/.ssh/id_ed25519.pub | echo 'SSH Public Key copied to pasteboard.'"

# IP addresses
alias pubip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Update Neovim NVChad
alias nupdate="nvim -c \"NvChadUpdate\""

# Update LunarVim
alias lvupdate="lvim +LvimUpdate +q"
