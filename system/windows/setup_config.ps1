# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Creating Symbolic Links"

New-Symlink "$env:USERPROFILE\.dotfiles\config\git\config" "$env:USERPROFILE\.gitconfig"
New-Symlink "$env:USERPROFILE\.dotfiles\config\git\ignore_global" "$env:USERPROFILE\.config\git\.gitignore.global"

New-Symlink "$env:USERPROFILE\.dotfiles\config\starship\starship.toml" "$env:USERPROFILE\.config\starship.toml"
New-Symlink "$env:USERPROFILE\.dotfiles\config\hyper\.hyper.js" "$env:USERPROFILE\AppData\Roaming\Hyper\.hyper.js"

New-Symlink "$env:USERPROFILE\.dotfiles\config\alacritty\alacrittyWindows.yml" "$env:USERPROFILE\AppData\Roaming\alacritty\alacritty.yml"
