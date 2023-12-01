function Install-Dotfiles {
    # Get Windows version
    $osInfo = systeminfo | findstr /B /C:"OS Name" | ForEach-Object { $_.TrimStart("OS Name:").Trim() }

    # Return if not supported
    if ($osInfo -notlike "*Windows*") {
        Write-Host "$($osInfo) not supported."
        return
    }

    # Define 
    $repoUrl = "https://github.com/excalith/.dotfiles/archive/main.zip"
    $downloadPath = "$env:TEMP"

    # Check if dotfiles folder exists
    if (Test-Path -Path "$env:USERPROFILE\.dotfiles") {
        Write-Host ".dotfiles folder already exists."
        return
    }

    try {
        # Download the repository
        Invoke-WebRequest -Uri $repoUrl -OutFile "$downloadPath\.dotfiles.zip"

        # Extract it to user folder
        Expand-Archive -Path "$downloadPath\.dotfiles.zip" -DestinationPath $env:USERPROFILE

        # Rename the folder name
        Rename-Item "$env:USERPROFILE\.dotfiles-main" "$env:USERPROFILE\.dotfiles"

        # Remove ZIP file
        Remove-Item -Path "$downloadPath\.dotfiles.zip"
        
        Write-Host "Dotfiles installed successfully."
    }
    catch {
        Write-Host "Error: $_"
    }
}

function Start-Setup {
    # Define the path to the additional script
    $additionalScript = Join-Path $env:USERPROFILE '.dotfiles\system\windows\install.ps1'

    # Check if the additional script exists
    if (-not (Test-Path -Path $additionalScript)) {
        Write-Host "Error: Additional script not found at $additionalScript."
        return
    }

    try {
        # Run the additional script
        . $additionalScript

        Write-Host "Additional installation script executed successfully."
    }
    catch {
        Write-Host "Error: $_"
    }
}

Install-Dotfiles

Start-Setup
