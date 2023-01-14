#!/bin/sh

echo "$(tput setaf 10)┌─────────────────────────────────┐$(tput sgr0)"
echo "$(tput setaf 10)│        Applying Defaults        │$(tput sgr0)"
echo "$(tput setaf 10)└─────────────────────────────────┘$(tput sgr0)"


#==================================
# Source utilities
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"


#==================================
# Pre-Warm
#==================================
# Close any open System Preferences panes, to prevent them from overriding
osascript -e 'tell application "System Preferences" to quit'

# Become root
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

#==================================
# Dock
#==================================
print_title "Dock Settings"

ask_for_confirmation "'Would you like to add Dock shortcuts?"
printf "\n"

if answer_is_yes; then
    print_success "Adding shortcuts to dock"
    # defaults delete com.apple.dock persistent-apps &> /dev/null
    dockutil --add "/Applications/Brave Browser.app" &> /dev/null
    dockutil --add "/Applications/Spark.app" &> /dev/null
    dockutil --add "/Applications/WhatsApp.app" &> /dev/null
    dockutil --add "/Applications/Telegram Desktop.app" &> /dev/null
    dockutil --add "/Applications/Discord.app" &> /dev/null
    dockutil --add "/Applications/Slack.app" &> /dev/null
    dockutil --add "/Applications/Craft.app" &> /dev/null
    dockutil --add "/Applications/Alacritty.app" &> /dev/null
    dockutil --add "/Applications/Fork.app" &> /dev/null
    dockutil --add "/Applications/Visual Studio Code.app" &> /dev/null
    dockutil --add "/Applications/Spotify.app" &> /dev/null
fi

execute "defaults write com.apple.dock orientation left" "Set dock position"
execute "defaults write com.apple.dock show-recents -bool FALSE" "Hide recents on dock"
execute "defaults write com.apple.dock minimize-to-application -bool FALSE" "Disable minimize"


#==================================
# General UI / UX
#==================================
print_title "UI / UX Settings"
# echo -e 'Write Your Computer and Host Name'
# read compname

# Set computer name (as done via System Preferences → Sharing)
# sudo scutil --set ComputerName $compname
# sudo scutil --set HostName $compname
# sudo scutil --set LocalHostName $compname
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $compname

# Disable the sound effects on boot
execute "sudo nvram SystemAudioVolume=' '" "Disable sound on boot"

# Set sidebar icon size to medium
execute "defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2" "Set sidebar icon size"

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'WhenScrolling'" "Set scrollbar display"

## Font Smoothing
execute "defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO" "Set CG font smoothing"
execute "defaults -currentHost write -globalDomain AppleFontSmoothing -int 2" "Set Apple font smoothing"

#==================================
# Finder
#==================================
print_title "Finder Settings"

# Show path bar
execute "defaults write com.apple.finder ShowPathbar -bool true" "Show path bar"

# Keep folders on top when sorting by name
execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" "Keep folders on top"

# When performing a search, search the current folder by default
execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" "Search current folder by default"

# Disable the warning when changing a file extension
execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" "Disable file extension change warning"

# Avoid creating .DS_Store files on network or USB volumes
execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" "Prevent creaing .DS_Store on network"
execute "defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" "Prevent creaing .DS_Store on USB"

# Show hidden files by default
execute "defaults write com.apple.finder AppleShowAllFiles -bool true" "Always show hidden files"

# Save screenshots to the desktop
execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" "Save screenshots to Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
execute "defaults write com.apple.screencapture type -string 'png'" "Save screenshots as PNG"


#==================================
# Security
#==================================
print_title "Security Settings"

# Enable Firewall
execute "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on" "Enable Firewall"


#==================================
# Kill Apps
#==================================
for app in "Activity Monitor" \
    "Address Book" \
    "Calendar" \
    "cfprefsd" \
    "Contacts" \
    "Dock" \
    "Finder" \
    "Mail" \
    "Messages" \
    "Photos" \
    "Safari" \
    "Spectacle" \
    "SystemUIServer" \
    "Terminal"; do
    killall "${app}" &>/dev/null
done
print_result $? "Killing Apps"