# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Setting Up Shell"

Write-Title "CMD Profile"
try {
    # Symlink the alias.cmd file to the user's home directory
    New-Symlink "$env:USERPROFILE\.dotfiles\config\cmd\alias.cmd" "$env:USERPROFILE\alias.cmd" *> $null

    # Get the current AutoRun value
    $currentAutoRun = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -ErrorAction SilentlyContinue

    # If the AutoRun value exists and does not contain the alias.cmd command, append to it; otherwise, create it
    if ($currentAutoRun) {
        if ($currentAutoRun.AutoRun -notmatch 'alias\.cmd') {
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value ("{0}&%USERPROFILE%\alias.cmd" -f $currentAutoRun.AutoRun)
            Write-Success "CMD Profile Registered"
        }
        else {
            Write-Warning "CMD Profile already registered"
        }
    }
    else {
        New-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value "%USERPROFILE%\alias.cmd"
        Write-Success "CMD Profile Registered"
    }

    # Set up Starship for Clink CMD
    try {
        $filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua') > $null
        $fileContent = "load(io.popen('starship init cmd'):read('*a'))()" > $null
        New-Item -ItemType Directory -Force -Path (Split-Path $filePath) > $null
        Set-Content -Path $filePath -Value $fileContent > $null
        Write-Success "CMD Clink initiation for Starship"
    }
    catch {
        Write-Error "Starship failed to initialize for Clink CMD"
    }
}
catch {
    Write-Error "CMD Profile registration failed"
}


Write-Title "Powershell Profile"
try {
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$PROFILE" *> $null
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$env:USERPROFILE\Documents\Powershell" 
    Write-Success "Powershell Profile Registered"
}
catch {
    Write-Error "Powershell Profile registration failed"
}
