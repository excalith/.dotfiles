# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

# Prepare for Ubuntu WSL
Write-Section "Setting Up WSL2 (Optional)"

$confirmation = Read-Question "Do you want to install WSL2? (y/n)"

if ($confirmation -eq 'y') {
# Enable WSL Feature
try {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart  > $null
    Write-Success "Enabled Microsoft-Windows-Subsystem-Linux"
}
catch {
    Write-Error "Failed to enable Microsoft-Windows-Subsystem-Linux"
}

# Enable Virtual Machine Platform
try {
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart > $null
    Write-Success "Enabled VirtualMachinePlatform"
}
catch {
    Write-Error "Failed to enable VirtualMachinePlatform"
}

# Enable WSL 2
Write-Title "Installing WSL2"

try {
    Write-Warn "Will Switch To WSL2 Shell Now!"
    Write-LineBreak
    wsl.exe --install > $null
    wsl.exe --update > $null
    wsl --set-default-version 2  > $null

    # Install Ubuntu (installed via winget packages)
    ubuntu
}
catch {
    Write-Error "Failed to install WSL2"
}
}
else
{
    Write-Skipped "Skipped WSL2 setup"
    Write-Host ""
}