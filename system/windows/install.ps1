# $HOME = $env:USERPROFILE # This is Read-Only
$DOTFILES = Join-Path $HOME ".dotfiles"
$CONFIG = Join-Path $HOME ".config"

Write-Host "Running Additional Script"
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
Set-ExecutionPolicy Bypass -Scope Process

# Setup Config

# Setup Packages

# Setup Fonts

# Setup Shell