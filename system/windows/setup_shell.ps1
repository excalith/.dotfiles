# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"

Write-Section "Setting Up Shell"

# Update Clink AutoRun
Write-Title "Update Clink Autorun"
try {
    # Get the current AutoRun value from the Command Processor registry key
    $currentAutoRun = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -ErrorAction SilentlyContinue

    # Define the new Clink command with the --quiet option
    $newClinkCommand = '"C:\Program Files (x86)\clink\clink.bat" inject --autorun --profile ~\clink --quiet'

    # Define a regex pattern to match any existing Clink command
    $clinkPattern = '.*clink\.bat.*'

    # Check if the AutoRun exists and contains Clink, and if so, update it if --quiet is missing
    if ($currentAutoRun -and $currentAutoRun -match $clinkPattern) {
        # Check if --quiet is missing
        if ($currentAutoRun -notmatch '--quiet') {
            $updatedAutoRun = $currentAutoRun -replace $clinkPattern, '$0 --quiet'
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value $updatedAutoRun
            Write-Success "Clink Autorun updated with --quiet option"
        } else {
            Write-Warning "Clink Autorun already contains --quiet"
        }
    }
    else {
        # Set the AutoRun to include the Clink command
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value $newClinkCommand
        Write-Success "Clink Autorun created"
    }
}
catch {
    Write-Error "Failed to update Clink Autorun"
}

# Update CMD Profile
Write-Title "CMD Profile"
try {
    # Symlink the alias.cmd file from dotfiles to the user's home directory
    New-Symlink "$env:USERPROFILE\.dotfiles\config\cmd\alias.cmd" "$env:USERPROFILE\alias.cmd" *> $null

    # Get the current AutoRun value again
    $currentAutoRun = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -ErrorAction SilentlyContinue

    # Check if the AutoRun exists and contains alias.cmd, and if not, append it
    if ($currentAutoRun) {
        if ($currentAutoRun.AutoRun -notmatch 'alias\.cmd') {
            $newAutoRun = "{0}&%USERPROFILE%\alias.cmd" -f $currentAutoRun.AutoRun
            Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value $newAutoRun
            Write-Success "CMD Profile registered"
        } else {
            Write-Warning "CMD Profile already registered"
        }
    }
    else {
        # If no AutoRun exists, create it with alias.cmd
        New-ItemProperty -Path 'HKCU:\Software\Microsoft\Command Processor' -Name AutoRun -Value "%USERPROFILE%\alias.cmd"
        Write-Success "CMD Profile registered"
    }

    # Set up Starship for Clink CMD
    try {
        $filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua')

        # If starship.lua doesn't exist, create it
        if (-not (Test-Path -Path $filePath)) {
            $fileContent = "load(io.popen('starship init cmd'):read('*a'))()"
            New-Item -ItemType Directory -Force -Path (Split-Path $filePath) > $null
            Set-Content -Path $filePath -Value $fileContent > $null
            Write-Success "Starship initiated for Clink CMD"
        } else {
            Write-Warning "Starship already initiated for Clink CMD"
        }
    }
    catch {
        Write-Error "Failed to initialize Starship for Clink CMD"
    }
}
catch {
    Write-Error "CMD Profile registration failed"
}

Write-Title "Powershell Profile"
try {
    # Symlink Powershell profile to the old Powershell version location
    New-Item -ItemType "directory" -Path "\Documents\WindowsPowershell" -ErrorAction SilentlyContinue
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    Write-Success "Powershell Profile for old versions registered"
    
    # Symlink Powershell profile to the new Powershell version location
    New-Item -ItemType "directory" -Path "\Documents\Powershell" -ErrorAction SilentlyContinue
    New-Symlink "$env:USERPROFILE\.dotfiles\config\powershell\Microsoft.PowerShell_profile.ps1" "$env:USERPROFILE\Documents\Powershell\Microsoft.PowerShell_profile.ps1"
    Write-Success "Powershell Profile for new versions registered"

}
catch {
    Write-Error "Powershell Profile registration failed"
}
