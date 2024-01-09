# Init Starship
Invoke-Expression (& starship init powershell)

# Commands
Set-Alias -Name lg -Value 'lazygit'
Set-Alias -Name ld -Value 'lazydocker'

# Common directories
function dotfiles { Set-Location -Path "$env:USERPROFILE\.dotfiles\$args" }
function dropbox { Set-Location -Path "$env:USERPROFILE\Dropbox\$args" }

# Easy navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function ..... { Set-Location ../../../.. }