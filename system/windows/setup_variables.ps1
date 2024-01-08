# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Creating Up Variables"

Set-EnvironmentVariable "DOTFILES_PATH" "$env:USERPROFILE\.dotfiles"
Set-EnvironmentVariable "GIT_SSH" "C:\Windows\System32\OpenSSH\ssh.exe"