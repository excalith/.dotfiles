# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Installing WinGet Packages"

# Update Winget MS Store
Write-Title "Updating Winget MS Store"
try {
    winget source update --name msstore > $null
    Write-Success "Updated Winget Source MS Store"   
}
catch {
    Write-Error "Failed to update Winget MS Store"
}

# Initial
Write-Title "Initial Packages"
Install-WingetPackage "Firefox" "Mozilla.Firefox"
Install-WingetPackage "1Password" "AgileBits.1Password"
Install-WingetPackage "GeForceExperience" "Nvidia.GeForceExperience"

# Development
Write-Title "Development Packages (CLI)"
Install-WingetPackage "Git" "Git.Git"
Install-WingetPackage "Git LFS" "GitHub.GitLFS"
Install-WingetPackage "Clink" "chrisant996.Clink"
Install-WingetPackage "Alacritty" "Alacritty.Alacritty"
Install-WingetPackage "Starship" "Starship.Starship"
Install-WingetPackage "delta" "dandavison.delta"
Install-WingetPackage "bat" "sharkdp.bat"
Install-WingetPackage "eza" "eza-community.eza"
Install-WingetPackage "micro" "zyedidia.micro"
Install-WingetPackage "gum" "charmbracelet.gum"
Install-WingetPackage "fzf" "junegunn.fzf"
Install-WingetPackage "yq" "MikeFarah.yq"
Install-WingetPackage "ripgrep" "BurntSushi.ripgrep.MSVC"
Install-WingetPackage "lazygit" "JesseDuffield.lazygit"
Install-WingetPackage "lazydocker" "JesseDuffield.Lazydocker"
Install-WingetPackage "Python 3.12" "Python.Python.3.12"
Install-WingetPackage "NodeJS" "OpenJS.NodeJS"
Install-WingetPackage "PowerShell" "Microsoft.Powershell"

Write-Title "Development Packages (GUI)"
Install-WingetPackage "JetBrains.Rider" "JetBrains.Rider"
Install-WingetPackage "VisualStudioCode" "Microsoft.VisualStudioCode"
Install-WingetPackage "Fork" "Fork.Fork"
Install-WingetPackage "RenderDoc" "BaldurKarlsson.RenderDoc"
Install-WingetPackage "DockerDesktop" "Docker.DockerDesktop"
Install-WingetPackage "Insomnia" "Insomnia.Insomnia"

# Art
Write-Title "Art Packages"
Install-WingetPackage "Blender" "BlenderFoundation.Blender"
Install-WingetPackage "Affinity Photo 2" "9P8DVF1XW02V" "msstore"
Install-WingetPackage "Affinity Designer 2" "9N2D0P16C80H" "msstore"

# Productivity
Write-Title "Productivity Packages"
Install-WingetPackage "Notion" "Notion.Notion"
Install-WingetPackage "Dropbox" "Dropbox.Dropbox"
Install-WingetPackage "Flameshot" "Flameshot.Flameshot"
Install-WingetPackage "muCommander" "muCommander.muCommander"

# Game
Write-Title "Game Packages"
Install-WingetPackage "EpicGamesLauncher" "EpicGames.EpicGamesLauncher"
Install-WingetPackage "Steam" "Valve.Steam"

# Social
Write-Title "Social Packages"
Install-WingetPackage "Mailbird" "XP9KHKVP3JKR39" "msstore"
Install-WingetPackage "Discord" "Discord.Discord"
Install-WingetPackage "TelegramDesktop" "Telegram.TelegramDesktop"
Install-WingetPackage "WhatsApp" "9NKSQGP7F2NH" "msstore"

# Media
Write-Title "Media Packages"
Install-WingetPackage "Spotify" "9NCBCSZSJRSB" "msstore"
Install-WingetPackage "Disney+" "9NXQXXLFST89" "msstore"
Install-WingetPackage "Amazon Prime" "9P6RC76MSMMJ" "msstore"
Install-WingetPackage "Apple TV (Preview)" "9NM4T8B9JQZ1" "msstore"
Install-WingetPackage "VLC" "VideoLAN.VLC"
Install-WingetPackage "7zip" "7zip.7zip"
Install-WingetPackage "HandBrake" "HandBrake.HandBrake"
Install-WingetPackage "OBS Studio" "OBSProject.OBSStudio"

# Utilities
Write-Title "Utilities Packages"
Install-WingetPackage "PowerToys" "Microsoft.PowerToys"
Install-WingetPackage "SpeedTest" "Ookla.Speedtest.CLI"
Install-WingetPackage "Deluge" "DelugeTeam.Deluge"
Install-WingetPackage "Bitdefender" "Bitdefender.Bitdefender"
Install-WingetPackage "NeoFetch" "nepnep.neofetch-win"
