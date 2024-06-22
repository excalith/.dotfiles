#==================================
# Mini Utils
#==================================

apt_install() {
    print_log "$1"
    apt install -qq -y $1 &> /dev/null
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
apt update -y &> /dev/null

print_log "Upgrade APT Packages"
apt upgrade -y &> /dev/null


#==================================
# Install APT Packages
#==================================
print_title "Install Packages"

apt_install "fish"
apt_install "starship"
apt_install "curl"
apt_install "wget"
apt_install "micro"
apt_install "bat"
apt_install "eza"
apt_install "neofetch"
apt_install "termux-api"

print_log prettyping
curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping >/dev/null 2>&1
chmod +x prettyping

#==================================
# Termux Settings
#==================================
print_title "Termux Settings"

print_log "Request Storage Permission"
termux-setup-storage

print_log "Update termux properties"
wget -O $HOME/.config/termux/termux.properties/termux.properties https://raw.githubusercontent.com/excalith/.dotfiles/main/config/termux/termux.properties

mkdir -p $HOME/.termux

print_log "Update termux colors"
wget -O $HOME/.termux/colors.properties https://raw.githubusercontent.com/excalith/.dotfiles/main/config/termux/colors.properties

print_log "Update termux font"
wget -O $HOME/.termux/font.ttf https://raw.githubusercontent.com/excalith/.dotfiles/main/config/termux/font.ttf

print_log "Reload termux settings"
termux-reload-settings

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
mkdir -p $HOME/.config/fish
touch $HOME/.config/fish/config.fish
echo "starship init fish | source" > $HOME/.config/fish/config.fish

print_log "Add starship config"
wget -O $HOME/.config/starship.toml https://raw.githubusercontent.com/excalith/.dotfiles/main/config/starship/starship.toml &> /dev/null

print_log "Reload fish config"
fish -c 'source $HOME/.config/fish/config.fish'


#==================================
# End Setup
#==================================
print_section "Setup Complete"
printf "\n\n"

#==================================
# Start Fish Shell
#==================================
fish