#region Aliases
Set-Alias -Name lg -Value 'lazygit'
Set-Alias -Name ld -Value 'lazydocker'
Set-Alias -Name nano -Value 'micro'
Set-Alias -Name ls -Value eza -Force
Set-Alias -Name fz -Value fzfBrowse -Force
Set-Alias -Name ff -Value fzfFind -Force
#endregion Aliases

#region SHELL COMMANDS
# Reload PowerShell profile
function sreload {
    if (Test-Path $PROFILE) {
        . $PROFILE
        Write-Host "SUCCESS: PowerShell profile reloaded." -ForegroundColor Green
    } else {
        Write-Warning "PowerShell profile not found at: $PROFILE"
    }
}

# Returns true if the user is admin, false otherwise
function isadmin {
    $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    $esc = [char]27
    $reset = "$esc[0m"
    $white = "$esc[37m"
    $green = "$esc[32m"
    $red = "$esc[31m"
    $adminText = "$white Admin:$reset"

    if ($isAdmin) {
        Write-Host "$adminText $green$isAdmin$reset"
    } else {
        Write-Host "$adminText $red$isAdmin$reset"
    }
}

# Update core PowerShell packages
function supdateAdmin {
    $oldNoColor = $env:NO_COLOR
    $env:NO_COLOR = "1"

    $packages = @(
        "Microsoft.PowerShell",
        "chrisant996.Clink",
        "Starship.Starship"
    )

    $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if (-not $isAdmin) {
        Write-Host "supdate requires sudo access." -ForegroundColor Red
        $env:NO_COLOR = $oldNoColor
        return
    }

    try {
        Write-Host "Fetching installed packages..." -ForegroundColor Cyan

        $raw = & winget list --accept-source-agreements 2>$null | Out-String
        $clean = $raw -replace '\x1B\[[0-9;]*[a-zA-Z]', ''
        $lines = $clean -split "`r?`n"

        foreach ($package in $packages) {
            Write-Host "Checking $package..." -ForegroundColor Cyan

            $targetLine = $lines | Where-Object {
                $_ -match [regex]::Escape($package)
            } | Select-Object -First 1

            if ($targetLine) {
                $cols = $targetLine.Trim() -split '\s{2,}'

                # 5 Columns: Name, Id, Installed, Available, Source
                if ($cols.Count -ge 5 -and $cols[3] -notmatch '^winget') {
                    $installed = $cols[2]
                    $latest    = $cols[3]

                    Write-Host "  Status: Update Available" -ForegroundColor Yellow
                    Write-Host "  Installed: $installed  -->  Latest: $latest" -ForegroundColor Yellow
                    Write-Host "  Upgrading..." -ForegroundColor Cyan

                    $logOut = "$env:TEMP\winget_$($package)_out.log"
                    $logErr = "$env:TEMP\winget_$($package)_err.log"

                    if ($package -eq "Microsoft.PowerShell") {
                        # winget upgrade --id fails to match this package for some reason,
                        # but install -e (exact) works, and re-running install on an
                        # already-installed package upgrades it to latest if one's available.
                        $wingetArgs = "install -e --id $package --silent --accept-source-agreements --accept-package-agreements"
                    }
                    else {
                        $wingetArgs = "upgrade --id $package --silent --force --disable-interactivity --accept-source-agreements --accept-package-agreements"
                    }

                    if ($package -eq "Microsoft.PowerShell" -and -not $isAdmin) {
                        $proc = Start-Process -FilePath "winget" -ArgumentList $wingetArgs -Verb RunAs -Wait -PassThru
                    }
                    else {
                        $proc = Start-Process -FilePath "winget" `
                            -ArgumentList $wingetArgs `
                            -NoNewWindow -Wait -PassThru `
                            -RedirectStandardOutput $logOut `
                            -RedirectStandardError $logErr
                    }

                    if ($proc.ExitCode -eq 0) {
                        Write-Host "  Successfully upgraded to $latest!`n" -ForegroundColor Green
                    } else {
                        Write-Host "  Upgrade failed (Exit code: $($proc.ExitCode)). See $logOut / $logErr`n" -ForegroundColor Red
                    }
                }
                # 4 Columns: Up to Date
                else {
                    $installed = $cols[2]

                    Write-Host "  Status: Up to Date" -ForegroundColor Green
                    Write-Host "  Installed: $installed | Latest: $installed`n" -ForegroundColor DarkGray
                }
            } else {
                Write-Host "  Status: Not Found" -ForegroundColor Red
                Write-Host "  Package not installed or registered in winget.`n" -ForegroundColor DarkGray
            }
        }
    }
    finally {
        $env:NO_COLOR = $oldNoColor
    }
}
function supdate {
    sudo -N pwsh -NoExit -Command "supdateAdmin"
}

# Upgrade all winget packages
function pupdate {
    Write-Host "Upgrading all winget packages...`n" -ForegroundColor Cyan
    & winget upgrade --all --accept-source-agreements --accept-package-agreements

    switch ($LASTEXITCODE) {
        0           { Write-Host "All packages upgraded successfully.`n" -ForegroundColor Green }
        -1978236908 { Write-Host "All packages are already up to date.`n" -ForegroundColor Yellow }
        default     { Write-Host "Some packages failed to upgrade (Exit code: $LASTEXITCODE).`n" -ForegroundColor Red }
    }
}

#endregion SHELL COMMANDS

#region CUSTOM FUNCTIONS
# Common directories
function dotfiles { Set-Location -Path "$env:USERPROFILE\.dotfiles\$args" }
function dropbox { Set-Location -Path "$env:USERPROFILE\Dropbox\$args" }

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

# Function to replicate open . like linux
function open {
    if ($args.Count -eq 0) {
        Start-Process explorer.exe -ArgumentList "."
        return
    }

    foreach ($item in $args) {
        if (Test-Path $item) {
            $resolvedPath = Resolve-Path $item
            Start-Process $resolvedPath
        } else {
            Write-Warning "Path not found: $item"
        }
    }
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

# Easy navigation
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function ..... { Set-Location ../../../.. }

function nvmuse {
    nvm use $(Get-Content .nvmrc)
}
#endregion CUSTOM FUNCTIONS

#region EZA
function eza {
    $defaultArgs = @(
        '--group-directories-first'
        '-laho'
        '--no-user'
        '--icons'
        '--git'
        '--git-repos'
        '--time-style'
        'relative'
        '--sort=extension'
    )

    eza.exe @defaultArgs @args
}
#endregion EZA

#region FZF
function fzfBrowse {
    $esc   = [char]27
    $reset = "$esc[0m"

    # ANSI Color Palette
    $cDir   = "$esc[1;33m" # Bold Yellow (Directories)
    $cCode  = "$esc[32m"   # Green (Code)
    $cCfg   = "$esc[36m"   # Cyan (Config / Docs)
    $cMedia = "$esc[35m"   # Magenta (Media)
    $cBin   = "$esc[31m"   # Red (Executables / Archives)
    $cDot   = "$esc[37m"   # Light Gray (Dotfiles & .d.ts)
    $cOther = "$esc[97m"   # Bright White (Default)

    while ($true) {
        $rawItems = Get-ChildItem -Path . -Force
        if (-not $rawItems) {
            Write-Host "Directory is empty." -ForegroundColor DarkGray
            break
        }

        $items = $rawItems | ForEach-Object {
            $isDir = $_.PSIsContainer
            $name  = $_.Name
            $ext   = $_.Extension.TrimStart('.').ToLower()

            if ($isDir) {
                $weight  = 0
                $color   = $cDir
                $icon    = ""   # Directory icon
                $display = $name
            }
            # Checked before dotfiles so env.d.ts doesn't get captured as a generic dotfile
            elseif ($name.EndsWith('.d.ts', [System.StringComparison]::OrdinalIgnoreCase)) {
                $weight  = 900
                $color   = $cDot  # Light Gray
                $icon    = ""   # TS Definition
                $display = $name
            }
            # Dotfiles (weight 1000 puts them at the absolute bottom)
            elseif ($name.StartsWith('.')) {
                $weight  = 1000
                $color   = $cDot  # Light Gray
                $icon    = ""   # Dotfile / Config
                $display = $name
            }
            else {
                switch ($ext) {
                    # Code (Weight 10 - 70)
                    'js'    { $weight = 10;  $icon = ""; $color = $cCode }
                    'ts'    { $weight = 20;  $icon = ""; $color = $cCode }
                    'tsx'   { $weight = 30;  $icon = ""; $color = $cCode }
                    'jsx'   { $weight = 35;  $icon = ""; $color = $cCode }
                    'c'     { $weight = 40;  $icon = ""; $color = $cCode }
                    'cpp'   { $weight = 50;  $icon = ""; $color = $cCode }
                    'h'     { $weight = 60;  $icon = ""; $color = $cCode }
                    'hpp'   { $weight = 65;  $icon = ""; $color = $cCode }
                    'py'    { $weight = 70;  $icon = ""; $color = $cCode }

                    # Config & Docs (Weight 80 - 95)
                    'json'  { $weight = 80;  $icon = ""; $color = $cCfg }
                    'html'  { $weight = 85;  $icon = ""; $color = $cCfg }
                    'css'   { $weight = 90;  $icon = ""; $color = $cCfg }
                    'md'    { $weight = 95;  $icon = ""; $color = $cCfg }

                    # Media - Images (Weight 150)
                    'jpg'   { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'jpeg'  { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'png'   { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'gif'   { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'webp'  { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'svg'   { $weight = 150; $icon = "󰋩"; $color = $cMedia }
                    'ico'   { $weight = 150; $icon = "󰋩"; $color = $cMedia }

                    # Media - Audio (Weight 160)
                    'mp3'   { $weight = 160; $icon = "󰎈"; $color = $cMedia }
                    'wav'   { $weight = 160; $icon = "󰎈"; $color = $cMedia }
                    'flac'  { $weight = 160; $icon = "󰎈"; $color = $cMedia }
                    'm4a'   { $weight = 160; $icon = "󰎈"; $color = $cMedia }

                    # Media - Video (Weight 170)
                    'mp4'   { $weight = 170; $icon = "󰕧"; $color = $cMedia }
                    'mkv'   { $weight = 170; $icon = "󰕧"; $color = $cMedia }
                    'avi'   { $weight = 170; $icon = "󰕧"; $color = $cMedia }
                    'mov'   { $weight = 170; $icon = "󰕧"; $color = $cMedia }

                    # Binaries & Executables (Weight 500)
                    'exe'   { $weight = 500; $icon = "⚙"; $color = $cBin }
                    'dll'   { $weight = 500; $icon = "⚙"; $color = $cBin }
                    'bin'   { $weight = 500; $icon = "⚙"; $color = $cBin }
                    'dat'   { $weight = 500; $icon = "⚙"; $color = $cBin }

                    # Archives (Weight 510)
                    'zip'   { $weight = 510; $icon = ""; $color = $cBin }
                    'tar'   { $weight = 510; $icon = ""; $color = $cBin }
                    'gz'    { $weight = 510; $icon = ""; $color = $cBin }
                    '7z'    { $weight = 510; $icon = ""; $color = $cBin }

                    default { $weight = 800; $icon = "󰈔"; $color = $cOther }
                }
                $display = $name
            }

            [PSCustomObject]@{
                RawName   = $name
                Weight    = $weight
                FzfString = "$name`t$color$icon $display$reset"
            }
        } | Sort-Object Weight, RawName | ForEach-Object { $_.FzfString }

        $result = $items | fzf.exe `
            --ansi `
            --layout=reverse `
            --delimiter "\t" `
            --with-nth 2 `
            --prompt "$($PWD.ProviderPath)> " `
            --preview 'if exist {1}\* (echo Directory) else (bat.exe --color=always --style=numbers {1})' `
            --preview-window "right:60%:wrap"

        if (-not $result) {
            break
        }

        $target = ($result -split "`t")[0]

        if (Test-Path -LiteralPath $target -PathType Container) {
            Set-Location -LiteralPath $target
        }
        else {
            Invoke-Item -LiteralPath $target
            break
        }
    }
}

function fzfFind {
    $query = $args -join ' '

    # Force forward slashes so Windows backslashes do not break CMD string escaping
    $env:FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --path-separator /'

    $target = fzf.exe `
        --query="$query" `
        --layout=reverse `
        --prompt="$($PWD.ProviderPath)> " `
        --preview 'bat --color=always --style=numbers {}' `
        --preview-window "right:60%:wrap"

    if ($target) {
        if (Test-Path -LiteralPath $target -PathType Container) {
            Set-Location -LiteralPath $target
        }
        else {
            Invoke-Item -LiteralPath $target
        }
    }
}
#endregion FZF

#region INITIALIZATION
function Invoke-Starship-PreCommand {
    $host.ui.RawUI.WindowTitle = (Get-Item $pwd).Name
}


# Import Chocolatey Profile to enable tab-completions to function for `choco`.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Init Starship
Invoke-Expression (&starship init powershell)

# Init Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
#endregion INITIALIZATION
