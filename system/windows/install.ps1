function Run-Script {
    param (
        [string]$scriptPath
    )

    $fullScriptPath = Join-Path $env:USERPROFILE $scriptPath

    if (Test-Path -Path $fullScriptPath) {
        try {
            . $fullScriptPath
            $scriptName = (Get-Item $fullScriptPath).BaseName
            Write-Host "$scriptName executed successfully."
        }
        catch {
            Write-Host "Error: $_"
        }
    }
    else {
        Write-Host "Error: Script not found at $fullScriptPath."
    }
}

Write-Host "Running Windows Setup"

# Setup Variables
Run-Script ".dotfiles\system\windows\setup_variables.ps1"

# Setup Config
Run-Script ".dotfiles\system\windows\setup_config.ps1"

# Setup Packages
Run-Script ".dotfiles\system\windows\setup_packages.ps1"

# Setup Fonts
Run-Script ".dotfiles\system\windows\setup_fonts.ps1"

# Setup Shell
Run-Script ".dotfiles\system\windows\setup_shell.ps1"

# Generate Git Credentials
Run-Script ".dotfiles\scripts\utils\generate_git_creds.ps1"