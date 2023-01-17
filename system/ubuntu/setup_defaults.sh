#!/bin/sh
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Applying Ubuntu Defaults"


#==================================
# General UI / UX
#==================================
print_title "Desktop Environment Settings"
execute "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'" "Set dark mode"
execute "gsettings set org.gnome.desktop.background picture-uri file:///$HOME/.dotfiles/assets/wallpaper/ventura.jpg" "Set wallpaper"
execute "dconf write /org/gtk/settings/file-chooser/sort-directories-first true" "Show directories first"
execute "gsettings set org.gnome.desktop.interface clock-show-weekday true" "Show weekday in clock"
#execute "gsettings set org.gnome.nautilus.preferences always-use-location-entry true" "Show path as string"


#==================================
# Dock
#==================================
print_title "Dock Settings"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'" "Set dock click action"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false" "Set dock height"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false" "Hide trash icon"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false" "Hide mounts icon"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false" "Hide network icon"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32" "Set icon size"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false" "Set backlit false"
execute "gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false" "Disable hotkeys"
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []
gsettings set org.gnome.shell.keybindings switch-to-application-6 []
gsettings set org.gnome.shell.keybindings switch-to-application-7 []
gsettings set org.gnome.shell.keybindings switch-to-application-8 []
gsettings set org.gnome.shell.keybindings switch-to-application-9 []


#==================================
# Key Bindings
#==================================
print_title "Key Binding Settings"
print_success "Setting Up Key Bindings"
# Toggle Overview
gsettings set org.gnome.shell.keybindings toggle-overview "['<Ctrl>Above_Tab']"

# Switch Apps
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['<Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['<Shift><Super>Tab']"

# Switch Groups
dconf write /org/gnome/desktop/wm/keybindings/switch-group "['<Ctrl>Above_Tab','<Alt>Above_Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-group-backward "['<Shift><Ctrl>Above_Tab','<Shift><Alt>Above_Tab']"

# Switch Workspace
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['<Super><Alt>Up']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['<Super><Alt>Down']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['<Super><Alt>Left']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['<Super><Alt>Right']"

# Toggle Tiles
dconf write /org/gnome/mutter/keybindings/toggle-tiled-left "['<Super><Ctrl><Alt>Left']"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-right "['<Super><Ctrl><Alt>Right']"

# Disable Rest
gsettings set org.gnome.desktop.wm.keybindings toggle-shaded "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/maximize "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-up "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-down "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-left "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-right "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-panels "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-panels-backward "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/unmaximize "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-left "['disabled']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-right "['disabled']"