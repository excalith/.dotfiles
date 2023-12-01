Write-Host "Setting Up Shell"


# Prepare for Ubuntu WSL
# Enable WSL Feature and Virtual Machine Platform
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Enable WSL 2
wsl.exe --install
wsl --set-default-version 2
ubuntu


# Clink CMD Starship Init
$filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua')
$fileContent = "load(io.popen('starship init cmd'):read('*a'))()"
New-Item -ItemType Directory -Force -Path (Split-Path $filePath)
Set-Content -Path $filePath -Value $fileContent


# Powershell Starship Init
$powershellFilePath = Join-Path $env:USERPROFILE 'Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'
$powershellFileContent = 'Invoke-Expression (& starship init powershell)'

# Check if the file exists
if (-not (Test-Path -Path $powershellFilePath -PathType Leaf)) {
    # If the file doesn't exist, create it
    New-Item -ItemType File -Path $powershellFilePath -Force
    Write-Host "PowerShell profile created successfully."
}

# Add content to the file
Add-Content -Path $powershellFilePath -Value $powershellFileContent

