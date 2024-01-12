# Commands
Set-Alias -Name lg -Value 'lazygit'
Set-Alias -Name ld -Value 'lazydocker'
Set-Alias -Name nano -Value 'micro'

# Make a new directory and cd into it
function mkcd {
    if ($args.Count -eq 0) {
        Write-Host "ERROR: No directory name specified." -ForegroundColor Red
        return
    }
    $dir = $args[0]
    if (Test-Path $dir) {
        Write-Warning "Directory $dir already exists."
    } else {
        mkdir $dir > $null
    }
    Set-Location $dir
}

# Create a new file
function touch {
    if ($args.Count -eq 0) {
        Write-Host "ERROR: No file specified." -ForegroundColor Red
        return
    }
    $path = $args[0]
    if (Test-Path $path) {
        Write-Warning "File $path already exists."
    } else {
        New-Item -ItemType File -Path $path > $null
        Write-Host "SUCCESS: File $path created."  -ForegroundColor Green
    }
}

# Reload Powershell profile
function sreload {
    if (Test-Path $PROFILE) {
        . $PROFILE
        Write-Host "SUCCESS: PowerShell profile reloaded." -ForegroundColor Green
    } else {
        Write-Warning "PowerShell profile not found."
    }
}

# Update PowerShell
function supdate {
    winget upgrade Microsoft.Powershell
}

# Common directories
function dotfiles { Set-Location -Path "$env:USERPROFILE\.dotfiles\$args" }
function dropbox { Set-Location -Path "$env:USERPROFILE\Dropbox\$args" }

# Easy navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function ..... { Set-Location ../../../.. }

# Init Starship
Invoke-Expression (& starship init powershell)