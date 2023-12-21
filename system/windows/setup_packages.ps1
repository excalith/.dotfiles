# Starts installation through WinGet
function install_winget($package) {
  Write-Host "Installing: $package"
  winget install -e --id $package --accept-package-agreements
}

Write-Host  "Installing WinGet Packages"

# Initial
install_winget "AgileBits.1Password"
install_winget "Mozilla.Firefox"
install_winget "Nvidia.GeForceExperience"

# Development
install_winget "Git.Git"
install_winget "chrisant996.Clink"
install_winget "Alacritty.Alacritty"
install_winget "Vercel.Hyper"
install_winget "Starship.Starship"
install_winget "Microsoft.VisualStudioCode"
install_winget "JetBrains.Rider"
install_winget "Fork.Fork"
install_winget "OpenJS.NodeJS"
install_winget "BaldurKarlsson.RenderDoc"
install_winget "GitHub.GitLFS"
install_winget "Docker.DockerDesktop"

# Art
install_winget "BlenderFoundation.Blender"
install_winget "Figma.Figma"

# Productivity
install_winget "Notion.Notion"
install_winget "LukiLabs.Craft"

# Game
install_winget "EpicGames.EpicGamesLauncher"
install_winget "Valve.Steam"

# Social
install_winget "Mailbird.Mailbird"
install_winget "Discord.Discord"
install_winget "Telegram.TelegramDesktop"
# install_winget "WhatsApp.WhatsApp" # Old version

# Media
install_winget "Spotify.Spotify"
install_winget "VideoLAN.VLC"
install_winget "7zip.7zip"
install_winget "HandBrake.HandBrake"
install_winget "OBSProject.OBSStudio"

# Utilities
install_winget "Microsoft.PowerToys"
install_winget "DelugeTeam.Deluge"
install_winget "Bitdefender.Bitdefender"
# install_winget "SteelSeries.GG"
# install_winget "CPUID.CPU-Z.ROG"

# WSL
install_winget "Canonical.Ubuntu.2204"




# choco install nerd-fonts-firacode
# choco install nerd-fonts-firamono