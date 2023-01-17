#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_ubuntu.sh"


#==================================
# Print Section Title
#==================================
print_section "Installing Fonts"

declare -a fonts=(
    FiraCode
    FiraMono
)

version='2.1.0'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir" >/dev/null 2>&1
fi

for (( i=0; i<=${#fonts[@]} - 1; i++ )); do 
    font=${fonts[$i]}
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"

    execute "wget --quiet $download_url" "${font}"
    unzip -o "$zip_file" -d "$fonts_dir"  &> /dev/null
    rm "$zip_file"  &> /dev/null
done

find "$fonts_dir" -name '*Windows Compatible*' -delete  &> /dev/null

execute "fc-cache -fv" "Updating font cache"
