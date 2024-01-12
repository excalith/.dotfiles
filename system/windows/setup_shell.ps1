# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Setting Up Shell"

Write-Title "Update Clink Autorun"
try {
    # Get the current AutoRun value
    $currentAutoRun = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -ErrorAction SilentlyContinue

    # Define the new Clink command with the --quiet option
    $newClinkCommand = '"C:\Program Files (x86)\clink\clink.bat" inject --autorun --profile ~\clink --quiet'

    # Define a regex pattern to match the Clink command
    $clinkPattern = '.*clink\.bat.*'

    # If the AutoRun value exists and contains the Clink command, check if the --quiet option exists and add it if it doesn't; otherwise, create it
    if ($currentAutoRun -and $currentAutoRun -match $clinkPattern) {
        # If the --quiet option does not exist in the Clink command, add it
        if ($currentAutoRun -notmatch '--quiet') {
            $currentAutoRun = $currentAutoRun -replace $clinkPattern, '$0 --quiet'
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value $currentAutoRun
            Write-Success "Clink Autorun Updated"
        }
        else {
            Write-Warning "Clink Autorun already updated"
        }
    }
    else {
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value $newClinkCommand
        Write-Success "Clink Autorun Created"
    }
}
catch {
    Write-Error "Clink Autorun update failed"
}

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
        $filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua')
        if (-not (Test-Path -Path $filePath)) {
            $fileContent = "load(io.popen('starship init cmd'):read('*a'))()"
            New-Item -ItemType Directory -Force -Path (Split-Path $filePath) > $null
            Set-Content -Path $filePath -Value $fileContent > $null
            Write-Success "CMD Clink initiation for Starship"
        } else {
            Write-Warning "Starship already initiated for Clink CMD"
        }
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
    # Symlink Powershell profile to the old Powershell version location
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell" *> $null
    Write-Success "Powershell Profile for old versions registered"
    
    # Symlink Powershell profile to the new Powershell version location
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$env:USERPROFILE\Documents\Powershell" *> $null
    Write-Success "Powershell Profile for new versions registered"

}
catch {
    Write-Error "Powershell Profile registration failed"
}
