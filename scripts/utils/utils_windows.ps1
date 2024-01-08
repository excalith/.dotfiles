


#==================================
# Invoke Script
#==================================
function Invoke-Script {
    param (
        [string]$scriptPath
    )

    $fullScriptPath = Join-Path $env:USERPROFILE $scriptPath

    if (Test-Path -Path $fullScriptPath) {
        try {
            . $fullScriptPath
            $scriptName = (Get-Item $fullScriptPath).BaseName
            Write-Host "$scriptName executed successfully."
        }
        catch {
            Write-Host "Error: $_"
        }
    }
    else {
        Write-Host "Error: Script not found at $fullScriptPath."
    }
}


#==================================
# Create New Symlink
#==================================
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

        # Get the home directory path
        $homeDir = [Environment]::GetFolderPath("UserProfile") + "\"

        # Get the paths relative to the home directory
        $relativeTargetPath = $TargetPath -replace [regex]::Escape($homeDir), ''
        $relativeSourcePath = $SourcePath -replace [regex]::Escape($homeDir), ''

        Write-Success "$relativeSourcePath  >  $relativeTargetPath"
    }
    catch {
        Write-Error "Error creating symbolic link: $_"
    }
}

#==================================
# Install WinGet and MS Store Packages
#==================================
function Install-WingetPackage {
    param (
        [string]$title,
        [string]$package,
        [string]$source = "winget"
    )

    # Write the initial message without a newline character
    Write-Item "$title"

    try {
        $output = winget install -e --id $package --source $source --accept-package-agreements 2>&1

        # Clear the line
        Write-Host "`r`n" -NoNewline

        if ($output -like '*successfully installed*') {
            Write-Success "$title installed successfully."
        }
        elseif ($output -like '*No available upgrade found*') {
            Write-Warning "$package is already installed and no updates found."
        }
        elseif ($output -like '*already installed*') {
            Write-Warning "$package is already installed."
        }
        else {
            Write-Error "Failed to install $package"
        }
    }
    catch {
        # Clear the line
        Write-Host "`r`n" -NoNewline

        Write-Error "An error occurred while trying to install $package"
    }
}

#==================================
# Install NerdFonts
#==================================
function Install-Font {
    param (
        [string]$FontFamily,
        [Object]$Destination
    )

    # Temporary directory for extracted font files
    $SourceDirectory = "$env:TEMP\$FontFamily"

    # Get all font files in the folder
    $FontFiles = Get-ChildItem -Path $SourceDirectory\* -Include *.ttf, *.otf, *.ttc -Recurse

    # Iterate all font files and install them
    foreach ($Font in $FontFiles) {
        $FontName = $Font.BaseName
        $FontPath = $Font.FullName

        # Install font using copyHere directly
        Write-Host "    Installing $FontName"
        $Destination.CopyHere($FontPath, 0x10)
    }
}

function Install-NerdFont {
    param (
        [string]$FontFamily,
        [string]$FontVersion,
        [Object]$Destination
    )

    Write-Title "Installing $FontFamily Family"

    try {
        # Construct the font URL with the extracted version number and font name
        $fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v$FontVersion/$FontFamily.zip"

        # Download the font ZIP file
        Write-Host "  Downloading $FontFamily"
        Invoke-WebRequest -Uri $fontUrl -OutFile "$env:TEMP\$FontFamily.zip"

        # Extract the font files
        Write-Host "  Extracting $FontFamily"
        Expand-Archive -Path "$env:TEMP\$FontFamily.zip" -DestinationPath "$env:TEMP\$FontFamily" -Force

        # Install the font files to the Fonts folder
        Install-Font -FontFamily $FontFamily -Destination $Destination

        Write-Success "Successfully installed $FontFamily font family"
    }
    catch {
        Write-Error "Failed to install $FontFamily font family"
    }
    finally {
        # Clean up temporary files
        try {
            Remove-Item "$env:TEMP\$FontFamily.zip" -Force
            Remove-Item "$env:TEMP\$FontFamily" -Recurse -Force
            Write-Success "Cleaned up temp files for $FontFamily"
        }
        catch {
            Write-Warning "Failed to clean up temporary files for $FontFamily"
        }
    }
}

#==================================
# Set Up Environment Variable
#==================================
function Set-EnvironmentVariable {
    param (
        [string]$VariableName,
        [string]$Path
    )

    try {
        setx $VariableName $Path > $null
        Write-Success "Setting $VariableName"
    }
    catch {
        Write-Error "Failed to set $VariableName to $Path"
    }
}

#==================================
# Set Up Git Credentials
#==================================
function Set-GitCredentials {
    $confirmation = Read-Question "  Do you want to update Git Credentials? (y/n)"
    if ($confirmation -eq 'y') {
        Write-LineBreak
        $username = Read-Host "  Git Username"
        $email = Read-Host "  Git E-Mail  "

        $configLocalPath = "$env:USERPROFILE\.config\git\.gitconfig.local"
        New-Item -ItemType File -Path $configLocalPath -Force | Out-Null

        $content = @"
[user]
    name = $username
    email = $email
"@
        Set-Content -Path $configLocalPath -Value $content

        Write-Host ""
        Write-Success "Generated git credentials"
    }
    else {
        Write-Skipped "Skipped git credentials setup"
        Write-Host ""
        Write-Host "You can manually enter your git credentials by running the following commands:"
        Write-Host "  git config --global user.name <Your Name>"
        Write-Host "  git config --global user.email <Your Email>"
    }
}


#==================================
# Print
#==================================
function Write-Section {
    param (
        [string]$Title
    )

    $TitleLength = $Title.Length
    $BorderLength = $TitleLength + 18

    $BannerTop = "+" + ("-" * ($BorderLength - 2)) + "+"
    $BannerBottom = "+" + ("-" * ($BorderLength - 2)) + "+"

    Write-Host ""
    Write-Host -ForegroundColor Green $BannerTop
    Write-Host -ForegroundColor Green "|        $Title        |"
    Write-Host -ForegroundColor Green $BannerBottom
    Write-Host ""
}

function Write-Item {
    param (
        [string]$title
    )

    Write-Host -NoNewline -ForegroundColor Green "-"
    Write-Host -NoNewline " $title"
}

function Write-Title {
    param (
        [string]$Message
    )

    Write-LineBreak
    Write-Host -ForegroundColor Magenta "$Message"
}

function Write-Success {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Green "  [SUCCESS] $Message"
}

function Write-Warning {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Yellow "  [WARN] $Message"
}

function Write-Skipped {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Yellow "  [SKIP] $Message"
}

function Write-Error {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Red "  [ERR] $Message"
}

function Read-Question {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Yellow "  [?] $Message" -NoNewline
    return Read-Host
}

function Write-In-White {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor White $Message
}

function Write-In-Green {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Green $Message
}

function Write-In-Purple {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Magenta $Message
}

function Write-In-Red {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Red $Message
}

function Write-In-Yellow {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Yellow $Message
}

function Write-In-Blue {
    param (
        [string]$Message
    )

    Write-Host -ForegroundColor Blue $Message
}

function Write-LineBreak {
    Write-Host ""
}