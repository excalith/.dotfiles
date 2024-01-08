Write-Host "Creating Environment Variables"

setx DOTFILES_PATH="$env:USERPROFILE\.dotfiles"	
setx GIT_SSH "C:\Windows\System32\OpenSSH\ssh.exe"