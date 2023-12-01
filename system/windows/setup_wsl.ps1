Write-Host "Setting Up WSL"

# Enable WSL Feature and Virtual Machine Platform
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Enable WSL 2 and set Version 2 as default
wsl.exe --install
wsl --set-default-version 2

# Install Ubuntu (installed via winget packages)
ubuntu
