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

# Flush DNS for MacOS
if [[ $OSTYPE == darwin* ]]; then
    alias flushdns='dscacheutil -flushcache'
fi

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

# Show time
alias ct="{print -z Current time is $(date)}"

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
    sh ~/.dotfiles/Generic/custom/gitignore/gi.zsh
}

# Custom key binding help
function help() {
    sh ~/.dotfiles/Generic/custom/help/help.zsh "$1"
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

# Update oh-my-zsh
alias supdate="omz update"

# Update Neovim NVChad
alias nvupdate="nvim -c \"NvChadUpdate\""

# Reload zsh sessions
function srefresh() {
    omz reload
}

# CD into dotfiles
function dotfiles() {
    cd ~/.dotfiles
}

# CD into dir from anywhere
alias j='fasd_cd -d'

# Fast CD into directories
function fd() {
    if [ $# -eq 0 ]; then
        cd "$(ls -d */ | fzf --no-preview)"
    else
        cd "$(ls -d $@/* | fzf --no-preview)"
    fi

    while [ 1 ]; do
        "$(ls -d */ | fzf --no-preview)" || break
    done
}

function print_colors() {
    echo -e "|039| \033[39mDefault \033[m  |049| \033[49mDefault \033[m  |037| \033[37mLight gray \033[m     |047| \033[47mLight gray \033[m"
    echo -e "|030| \033[30mBlack \033[m    |040| \033[40mBlack \033[m    |090| \033[90mDark gray \033[m      |100| \033[100mDark gray \033[m"
    echo -e "|031| \033[31mRed \033[m      |041| \033[41mRed \033[m      |091| \033[91mLight red \033[m      |101| \033[101mLight red \033[m"
    echo -e "|032| \033[32mGreen \033[m    |042| \033[42mGreen \033[m    |092| \033[92mLight green \033[m    |102| \033[102mLight green \033[m"
    echo -e "|033| \033[33mYellow \033[m   |043| \033[43mYellow \033[m   |093| \033[93mLight yellow \033[m   |103| \033[103mLight yellow \033[m"
    echo -e "|034| \033[34mBlue \033[m     |044| \033[44mBlue \033[m     |094| \033[94mLight blue \033[m     |104| \033[104mLight blue \033[m"
    echo -e "|035| \033[35mMagenta \033[m  |045| \033[45mMagenta \033[m  |095| \033[95mLight magenta \033[m  |105| \033[105mLight magenta \033[m"
    echo -e "|036| \033[36mCyan \033[m     |046| \033[46mCyan \033[m     |096| \033[96mLight cyan \033[m     |106| \033[106mLight cyan \033[m"
}


# Custom Folders
alias pr="cd ~/Projects"
alias rk="cd ~/Projects/Retroket"


# Switches Desktop Space
switchdesktop() {
    typeset -A desktophash
    desktophash[0]=29
    desktophash[1]=18
    desktophash[2]=19
    desktophash[3]=20
    desktophash[4]=21
    desktophash[5]=23
    desktophash[6]=22
    desktophash[7]=26
    desktophash[8]=28
    desktophash[9]=25
    desktopkey=${desktophash[$1]}
    osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
}
alias switchdesktop=switchdesktop