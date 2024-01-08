# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Setting Up Shell"

# Clink CMD Starship Init
try {
    $filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua') > $null
    $fileContent = "load(io.popen('starship init cmd'):read('*a'))()" > $null
    New-Item -ItemType Directory -Force -Path (Split-Path $filePath) > $null
    Set-Content -Path $filePath -Value $fileContent > $null
    Write-Success "Set up Starship for Clink CMD"
}
catch {
    Write-Error "Failed to set up Starship for Clink CMD"
}


# Powershell Starship Init
try {
    $powershellFilePath = Join-Path $env:USERPROFILE 'Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1' > $null
    $powershellFileContent = 'Invoke-Expression (& starship init powershell)' > $null

    # Check if the file exists
    if (-not (Test-Path -Path $powershellFilePath -PathType Leaf)) {
        # If the file doesn't exist, create it
        New-Item -ItemType File -Path $powershellFilePath -Force > $null
    }

    # Add content to the file
    Add-Content -Path $powershellFilePath -Value $powershellFileContent > $null

    Write-Success "Set up Starship for Clink Powershell"
}
catch {
    Write-Error "Failed to set up Starship for Powershell"
}