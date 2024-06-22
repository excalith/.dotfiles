#==================================
# Mini Utils
#==================================
apt_installed() {
    apt info "$1" &> /dev/null
}

apt_install() {
    declare -r PACKAGE="$1"

    if ! apt_installed "$PACKAGE"; then
		print_log "$PACKAGE"
        apt install --quiet --no-progress $EXTRA_ARGUMENTS $PACKAGE

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
    print_in_color "\n│        $TITLE        │" 3
    print_in_color "\n$BANNER_BOTTOM" 3
}

print_title() {
    print_in_color "\n • $1\n" 5
}

print_log() {
    print_in_color "   • $1\n" 2
}

print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}


#==================================
# Start Setup
#==================================
print_section "Excalith Dotfiles Setup"


#==================================
# Update APT Packages
#==================================
print_title "Update Packages"

print_log "Update APT Packages"
apt update &> /dev/null

print_log "Upgrade APT Packages"
apt upgrade &> /dev/null


#==================================
# Install APT Packages
#==================================
print_title "Install Packages"

apt_install fish
apt_install starship
apt_install wget
apt_install curl
apt_install micro
apt_install bat
apt_install eza
apt_install neofetch

print_log prettyping
curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping >/dev/null 2>&1
chmod +x prettyping


#==================================
# Change Shell
#==================================
print_title "Change Shell"

print_log "Changing Shell to Fish"
chsh -s fish


#==================================
# Update Configs
#==================================
print_title "Update Configs"

print_log "Add fish config"
echo "starship init fish | source" > ~/.config/fish/config.fish

print_log "Add starship config"
wget -O ~/.config/starship.toml https://raw.githubusercontent.com/excalith/dotfiles/main/config/starship/starship.toml &> /dev/null

print_log "Reload fish config"
fish -c 'source ~/.config/fish/config.fish'


#==================================
# End Setup
#==================================
print_section "Setup Complete"