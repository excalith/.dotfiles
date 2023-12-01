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

# New-Symlink "$env:USERPROFILE\.dotfiles\config\git\config" "$env:USERPROFILE\.config\git\.gitconfig"
# New-Symlink "$env:USERPROFILE\.dotfiles\config\git\ignore_global" "$env:USERPROFILE\.config\git\ignore_global"

# New-Symlink "$env:USERPROFILE\.dotfiles\config\starship\starship.toml" "$env:USERPROFILE\.config\starship.toml"
# New-Symlink "$env:USERPROFILE\.dotfiles\config\hyper\.hyper.js" "$env:USERPROFILE\AppData\Roaming\Hyper\.hyper.js"

New-Symlink "$env:USERPROFILE\.dotfiles\config\alacritty\alacrittyWindows.yml" "$env:USERPROFILE\AppData\Roaming\alacritty\alacritty.yml"

