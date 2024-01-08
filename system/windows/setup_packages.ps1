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
Write-Title "Development Packages"
Install-WingetPackage "Git" "Git.Git"
Install-WingetPackage "Clink" "chrisant996.Clink"
Install-WingetPackage "Alacritty" "Alacritty.Alacritty"
Install-WingetPackage "Hyper" "Vercel.Hyper"
Install-WingetPackage "Starship" "Starship.Starship"
Install-WingetPackage "VisualStudioCode" "Microsoft.VisualStudioCode"
Install-WingetPackage "Rider" "JetBrains.Rider"
Install-WingetPackage "Fork" "Fork.Fork"
Install-WingetPackage "NodeJS" "OpenJS.NodeJS"
Install-WingetPackage "RenderDoc" "BaldurKarlsson.RenderDoc"
Install-WingetPackage "GitLFS" "GitHub.GitLFS"
Install-WingetPackage "DockerDesktop" "Docker.DockerDesktop"
Install-WingetPackage "Insomnia" "Insomnia.Insomnia"
Install-WingetPackage "delta" "dandavison.delta"
Install-WingetPackage "bat" "sharkdp.bat"

# Art
Write-Title "Art Packages"
Install-WingetPackage "Blender" "BlenderFoundation.Blender"
Install-WingetPackage "Figma" "Figma.Figma"

# Productivity
Write-Title "Productivity Packages"
Install-WingetPackage "Notion" "Notion.Notion"
Install-WingetPackage "Craft" "LukiLabs.Craft"

# Game
Write-Title "Game Packages"
Install-WingetPackage "EpicGamesLauncher" "EpicGames.EpicGamesLauncher"
Install-WingetPackage "Steam" "Valve.Steam"

# Social
Write-Title "Social Packages"
Install-WingetPackage "Canary Mail" "XPDC1PRBHG5NJ3" "msstore"
Install-WingetPackage "Discord" "Discord.Discord"
Install-WingetPackage "TelegramDesktop" "Telegram.TelegramDesktop"

# Media
Write-Title "Media Packages"
Install-WingetPackage "Spotify" "Spotify.Spotify"
Install-WingetPackage "VLC" "VideoLAN.VLC"
Install-WingetPackage "7zip" "7zip.7zip"
Install-WingetPackage "HandBrake" "HandBrake.HandBrake"
Install-WingetPackage "OBS Studio" "OBSProject.OBSStudio"

# Utilities
Write-Title "Utilities Packages"
Install-WingetPackage "PowerToys" "Microsoft.PowerToys"
Install-WingetPackage "Deluge" "DelugeTeam.Deluge"
Install-WingetPackage "Bitdefender" "Bitdefender.Bitdefender"

# WSL
Write-Title "WSL Packages"
Install-WingetPackage "Ubuntu 22.04" "Canonical.Ubuntu.2204"
