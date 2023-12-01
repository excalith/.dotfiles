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

# Example usage:
# New-Symlink "$env:USERPROFILE\.dotfiles\README.md" "$env:USERPROFILE\Documents\test\readme.txt"