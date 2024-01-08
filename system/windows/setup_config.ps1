function New-Symlink {
    param (
        $SourcePath,
        $TargetPath
    )

    $targetDir = Split-Path $TargetPath -Parent

    # Create the target directory if it doesn't exist
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    try {
        # Create a symbolic link
        New-Item -ItemType SymbolicLink -Path $TargetPath -Target $SourcePath -Force | Out-Null
        Write-Host "$TargetPath    →    $SourcePath"
    }
    catch {
        Write-Host "Error creating symbolic link: $_"
    }
}

Write-Host "Creating Symbolic Links"

New-Symlink "$env:USERPROFILE\.dotfiles\config\git\config" "$env:USERPROFILE\.gitconfig"
New-Symlink "$env:USERPROFILE\.dotfiles\config\git\ignore_global" "$env:USERPROFILE\.gitignore_global"
setx GIT_GLOBAL_IGNORE_PATH "$env:USERPROFILE\.gitignore_global"
setx GIT_CUSTOM_PATH "$env:USERPROFILE\.gitconfig_local"
setx GIT_SSH "C:\Windows\System32\OpenSSH\ssh.exe"

New-Symlink "$env:USERPROFILE\.dotfiles\config\starship\starship.toml" "$env:USERPROFILE\.config\starship.toml"
New-Symlink "$env:USERPROFILE\.dotfiles\config\hyper\.hyper.js" "$env:USERPROFILE\AppData\Roaming\Hyper\.hyper.js"

New-Symlink "$env:USERPROFILE\.dotfiles\config\alacritty\alacrittyWindows.yml" "$env:USERPROFILE\AppData\Roaming\alacritty\alacritty.yml"
