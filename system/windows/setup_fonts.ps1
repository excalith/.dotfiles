
# Create Shell.Application COM object
$Shell = New-Object -ComObject Shell.Application
$Destination = $Shell.Namespace(0x14)  # 0x14 is the Fonts folder

# Get the latest release information from GitHub API
$LatestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"

# Extract the version number
$FontVersion = $LatestRelease.tag_name -replace 'v', ''


# Function to install fonts from a directory to the Fonts folder and register in the Windows Registry
function Install-Font {
    param (
        [string]$FontFamily
    )

    # Temporary directory for extracted font files
    $SourceDirectory = "$env:TEMP\$FontFamily"

    # Get all font files in the folder
    $FontFiles = Get-ChildItem -Path $SourceDirectory\* -Include *.ttf, *.otf, *.ttc -Recurse

    # Iterate all font files and install them
    foreach ($Font in $FontFiles) {
        $FontName = $Font.BaseName
        $FontPath = $Font.FullName

        # Install font using copyHere directly
        Write-Host "    Installing $FontName"
        $Destination.CopyHere($FontPath, 0x10)
    }
}


# Download the latest NerdFonts release for the specified font family
function Install-NerdFont {
    param (
        [string]$FontFamily
    )

    Write-Host "Installing $FontFamily Family"

    # Construct the font URL with the extracted version number and font name
    $fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v$FontVersion/$FontFamily.zip"

    # Download the font ZIP file
    Write-Host "  Downloading $FontFamily"
    Invoke-WebRequest -Uri $fontUrl -OutFile "$env:TEMP\$FontFamily.zip"

    # Extract the font files
    Write-Host "  Extracting $FontFamily"
    Expand-Archive -Path "$env:TEMP\$FontFamily.zip" -DestinationPath "$env:TEMP\$FontFamily" -Force

    # Install the font files to the Fonts folder
    Install-Font -FontFamily $FontFamily

    # Clean up temporary files
    Remove-Item "$env:TEMP\$FontFamily.zip" -Force
    Remove-Item "$env:TEMP\$FontFamily" -Recurse -Force
}

# Install Fira Code Nerd Font
Install-NerdFont -FontFamily "FiraCode"

# Install FiraCode Nerd Font Mono
Install-NerdFont -FontFamily "FiraMono"


# Refresh the font cache
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 1
Start-Process explorer
