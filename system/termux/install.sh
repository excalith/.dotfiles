print_section "Excalith Dotfiles Setup"

#==================================
# Update APT Packages
#==================================
print_title "Update Packages"

print_log "Update APT Packages"
apt update

print_log "Upgrade APT Packages"
apt upgrade


#==================================
# Install APT Packages
#==================================
print_title "Install Packages"

apk_installed fish
apk_installed starship
apk_installed wget
apk_installed curl
apk_installed micro
apk_installed bat
apk_installed eza
apk_installed neofetch


curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping >/dev/null 2>&1
chmod +x prettyping

#==================================
# Install APT Packages
#==================================
print_title "Change Shell"

print_log "Changing Shell to Fish"
chsh -s $(which fish)


#==================================
# Mini Utils
#==================================
apk_installed() {
    apk info "$1" &> /dev/null
}

apt_install() {
    declare -r PACKAGE="$1"

    if ! apk_installed "$PACKAGE"; then
		print_log "$PACKAGE"
        apk add --quiet --no-progress $EXTRA_ARGUMENTS $PACKAGE

    else
        print_log "$PACKAGE"
    fi
}

print_section() {
    local TITLE="$*"
    local TITLE_LENGTH=${#TITLE}
    local BORDER_LENGTH=$((TITLE_LENGTH + 18))

    local i
    local BANNER_TOP
    for (( i = 0; i < BORDER_LENGTH; ++i )); do
        if [ $i = 0 ]; then
            BANNER_TOP+="╭"
        elif [ $i = $(($BORDER_LENGTH-1)) ]; then
            BANNER_TOP+="╮"
        else
            BANNER_TOP+="─"
        fi
    done

    local BANNER_BOTTOM
    for (( i = 0; i < BORDER_LENGTH; ++i )); do
        if [ $i = 0 ]; then
            BANNER_BOTTOM+="╰"
        elif [ $i = $(($BORDER_LENGTH-1)) ]; then
            BANNER_BOTTOM+="╯"
        else
            BANNER_BOTTOM+="─"
        fi
    done
    
    print_in_color "\n$BANNER_TOP" 3
    print_in_color "\n│        $TITLE        │\n" 3
    print_in_color "\n$BANNER_BOTTOM" 3
}

print_title() {
    print_in_color "\n • $1\n" 5
}

print_log() {
    print_in_color "\n • $1\n" 2
}

print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}

