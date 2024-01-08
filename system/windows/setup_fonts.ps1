# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Installing NerdFonts"

# Create Shell.Application COM object
$Shell = New-Object -ComObject Shell.Application
$Destination = $Shell.Namespace(0x14)  # 0x14 is the Fonts folder

# Get the latest release information from GitHub API
$LatestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

# Extract the version number
$FontVersion = $LatestRelease.tag_name -replace 'v', ''


# Install Fira Code Nerd Font
Install-NerdFont -FontFamily "FiraCode" -FontVersion $FontVersion -Destination $Destination

# Install FiraCode Nerd Font Mono
Install-NerdFont -FontFamily "FiraMono" -FontVersion $FontVersion -Destination $Destination


# Refresh the font cache
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 1
Start-Process explorer
