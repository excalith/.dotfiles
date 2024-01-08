function Main {
    Write-Host "Git Credentials"

    $confirmation = Read-Host "Do you want to update Git Credentials? (y/n)"
    Write-Host ""

    if ($confirmation -eq 'y') {
        $username = Read-Host "Git Username"
        $email = Read-Host "Git E-Mail"

        $configLocalPath = "$env:USERPROFILE\.config\git\.gitconfig.local"
        New-Item -ItemType File -Path $configLocalPath -Force | Out-Null

        $content = @"
[user]
    name = $username
    email = $email
"@
        Set-Content -Path $configLocalPath -Value $content

        Write-Host ""
        Write-Host "Generate git credentials"
    }
    else {
        Write-Host "Skipped git credentials setup"
    }
}

Main