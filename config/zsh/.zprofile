# Run dotfiles bin
alias dotfiles="bash ~/.dotfiles/bin/dotfiles/main.sh"
alias colors="bash ~/.dotfiles/bin/colors/colors.sh"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Clear terminal
alias c="clear"

# Command replacements
alias exa='command exa --group-directories-first -laFh --grid --git --icons'
alias cat=bat
alias man=batman
alias vim=nvim .
alias lg=lazygit
alias matrix='cmatrix -aBf'
alias ping=ping_pretty
alias fast='fast -u --single-line'

# History
alias h="history -15"    # last 10 history commands
alias hc="history -c"    # clear history
alias hg="history | rg " # +command

# SSH Public Keys
alias sshpubkey="pbcopy < ~/.ssh/id_ed25519.pub | echo 'SSH Public Key copied to pasteboard.'"

# GPG Public Key
function gpgpubkey() {
    gpg --armor --export "$@" | pbcopy | echo 'GPG Public Key copied to pasteboard.'
}

# IP addresses
alias pubip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Flush DNS
function flushdns() {
    printf "\nFlushing DNS\n"
    OS=$(uname)
    case $OS in
    Linux)
        sudo systemd-resolve --flush-caches
        ;;
    Darwin)
        dscacheutil -flushcache
        ;;
    esac
}

# Aliases for filetypes
alias -s .gitignore=neovim
alias -s txt=neovim
alias -s md=code
alias -s py=code
alias -s c=code
alias -s h=code
alias -s cpp=code
alias -s cs=code
alias -s js=code
alias -s json=code

# Makes directory and cd's into it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

# Install VSCode command line command
function code() {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

# Adds .gitignore files
function gi() {
    sh ~/.dotfiles/bin/gitignore/gi.zsh
}

# Custom Pretty Ping
function ping_pretty() {

    if [ $# -eq 0 ]; then
        prettyping --nolegend 1.1.1.1
    else
        prettyping --nolegend "$@"
    fi
}

function arasaka() {
    echo "\
                                                         ...--...                                                   \n\
                                                   .:oydmmmNNNNmmmdyo:.                                             \n\
                                                :sdNMMNmdhyhhhhyhdmNMMNds:                                          \n\
                                             -omMMNho:../ydmNNmdy/..:ohNMMdo.                                       \n\
                                           .sNMNh+.   .hMMMMMMMMMMh.   .+hNMNs.                                     \n\
                                          +NMNh:      mMMMMMMMMMMMMm      :hNMN+                                    \n\
                                         yMMm/       :MMMMMMMMMMMMMM:       /mMMy                                   \n\
                                        dMMh.        .NMMMMMMMMMMMMN.        .hMMd                                  \n\
                                       hMMh .ohdmmdho-+NMMMMMMMMMMN+-ohdmmdho. hMMh                                 \n\
                                      /MMN-sNMMMMMMMMMh/smNMMMMNms/hMMMMMMMMMNs-NMM/                                \n\
                                      dMMohMMMMMMMMMMMMm  -mMMm-  mMMMMMMMMMMMMhoMMd                                \n\
                                     .MMM:MMMMMMMMMMMMMM/  dMMd  /MMMMMMMMMMMMMM/MMM.                               \n\
                                     -MMM.NMMMMMMMMMMMMM-  dMMd  -MMMMMMMMMMMMMN.MMM-                               \n\
                                     -MMM /NMMMMMMMMMMMh   dMMd   hMMMMMMMMMMMN/ MMM-                               \n\
                                      NMM/ -yNMMMMMMNMMMh: dMMd :hMMMNMMMMMMNy- /MMN                                \n\
                                      sMMd    -/+++: /dMMMhmMMNhMMMd: :+++/-    dMMs                                \n\
                                       NMM+            /dMMMMMMMMd/            +MMN                                 \n\
                                       :MMM+             /dMMMMd/             +MMM:                                 \n\
                                        :NMMs              mMMm              sMMN:                                  \n\
                                         -dMMm/            dMMd            /mMMd-                                   \n\
                                           oNMMd/          dMMd          /dMMNo                                     \n\
                                             omMMNy/.      dMMd      ./yNMMmo                                       \n\
                                               /yNMMNmho+::yhhy::+ohmNMMNy/                                         \n\
                                                  -oymNMMMNNNNNNMMMNmyo-                                            \n\
                                                       -:/+oooo+/:-                                                 \n\
                                                                                                                    \n\
         -+osyyyo.   -yyyyyyyyyyyyys+.    ./osyyys-          .yyyys:       -/osyyyo.   /yyy-   .+yyyyso++syyyy+     \n\
       +dNMMMMMMMmo. :MMMMMMMMMMMMMMMm  /hNMMMMMMMNy-        -MMMMMNd/   +dNMMMMMMMmo. yMMM:.+hNMMMmhdNNMMMMMMMm+   \n\
     .dMMMho/:/hMMMmo:MMMd///////+mMMM-yMMMds/::yNMMNy.-+oooosdsoooo++ .hMMMdo/:/hMMMmoyMMMmNMMMmy::mMMNho/:/hMMMm+ \n\
     yMMM+      :NMMM/MMMh        ohhhsMMMy      -dMMM: ./hNMMMmy:     yMMM+      :NMMMyMMMMMmy:   dMMM:      /MMMm \n\
     mMMM.       NMMM:NMMMms:         sMMM+       yMMM:----.+hNMMMms:  dMMM-       mMMMsNMMMMs-    NMMN        MMMm \n\
     +MMMd:.     NMMM-dMMMMMMms:      -NMMm+.     yMMM:NMMN.  -odMMMMmssMMMd/.     mMMMomMMMMMNdo- sMMMh:.     MMMm \n\
      +mMMMmdddy.NMMM-hhho+dNMMMds:    :dMMMNmddh:yMMM:mMMMmddddmMMMMMMs+mMMMmdddy.mMMMohhh+sdMMMNdohNMMMmddds.MMMm \n\
       .+hmNNNNNomNNN       -+dNNNNho.   /ydmNNNNhsNNN::dNNNNNNNNNNNNNNo .+hmmNNNNodNNN       :smNNNmmdmmNNNNN/NNNd \n\
                                                                                                                    \n\
" | nms -f red -ca
}

# Update Neovim NVChad
alias nvupdate="nvim -c \"NvChadUpdate\""

# Reload zsh sessions
function sreload() {
    source ~/.zprofile
    source ~/.zshrc
}

# Update shell
function supdate() {
    printf "\nUpdating zsh\n"
    OS=$(uname)
    case $OS in
    Linux)
        sudo apt upgrade -qqy --fix-missing && sudo apt install --allow-unauthenticated -qqy "zsh"
        ;;
    Darwin)
        brew upgrade zsh
        ;;
    esac
}

# CD into dir from anywhere
alias j='fasd_cd -d'

# Fast CD into directories
alias fcd='cd $(tree -dfia -L 1 | fzf)'

function print_colors() {

}
