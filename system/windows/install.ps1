# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Running Windows Dotfiles Setup"

# Setup Variables
Invoke-Script ".dotfiles\system\windows\setup_variables.ps1"

# Setup Config
Invoke-Script ".dotfiles\system\windows\setup_config.ps1"

# Setup Packages
Invoke-Script ".dotfiles\system\windows\setup_packages.ps1"

# Setup Fonts
Invoke-Script ".dotfiles\system\windows\setup_fonts.ps1"

# Setup Shell
Invoke-Script ".dotfiles\system\windows\setup_shell.ps1"

# Generate Git Credentials
Invoke-Script ".dotfiles\system\windows\setup_git_creds.ps1"

# Setup WSL2
Invoke-Script ".dotfiles\system\windows\setup_wsl.ps1"

# Setup Complete
Write-Host -ForegroundColor Green "Excalith Dotfiles Successfully Installed"