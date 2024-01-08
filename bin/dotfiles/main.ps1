# Source Windows Utilities
. "$env:USERPROFILE\.dotfiles\scripts\utils\utils_windows.ps1"


function Main {
	gum style --foreground 212 --border-foreground 212 --border rounded --align center --width 40 --margin "0 0" --padding "0 0" 'Excalith Dotfiles' 'Maintenance'

    Write-LineBreak
	Write-In-Green "  Select an option"
	Show-Main-Menu
}

function Show-Main-Menu {
	$OPT_1="Directory"
	$OPT_2="Edit"
	$OPT_3="Create"
	$OPT_4="Sync"
	$OPT_9="Help"
	$OPT_0="Exit"
	
    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_4" "$OPT_9" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            Show-Dir-Menu
        }
        "$OPT_2" {
            Show-Edit-Menu
        }
        "$OPT_3" {
            Show-Create-Menu
        }
        "$OPT_4" {
            Show-Sync-Menu
        }
        "$OPT_9" {
            Show-Help-Menu
        }
        "$OPT_0" {
            Write-Host -ForegroundColor Green "  Bye!"
            exit
        }
    }
}

function Show-Dir-Menu {
	$OPT_1="Open Home"
	$OPT_2="Open Directory"
	$OPT_3="CD Into Directory"
	$OPT_0="Back"

    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_3" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            explorer.exe $env:USERPROFILE
        }
        "$OPT_2" {
            explorer.exe "$env:USERPROFILE\.dotfiles\"
        }
        "$OPT_3" {
            Set-Location -Path "$env:USERPROFILE\.dotfiles\"
        }
        "$OPT_0" {
            Show-Main-Menu
        }
    }
}

function Show-Edit-Menu {
	$OPT_1="Compare Changes"
	$OPT_2="Launch In Editor"
	$OPT_0="Back"

    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            git diff | delta
        }
        "$OPT_2" {
            code $env:USERPROFILE\.dotfiles\
        }
        "$OPT_0" {
            Show-Main-Menu
        }
    }
}


function Show-Create-Menu {
    $OPT_1="Create Symlinks"
    $OPT_0="Back"

    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            . "$env:USERPROFILE\.dotfiles\system\windows\setup_config.ps1"
        }
        "$OPT_0" {
            Show-Main-Menu
        }
    }
}

function Show-Sync-Menu {
    $OPT_1="Pull Changes"
    $OPT_2="Commit & Push Changes"
    $OPT_9="Initialize Repository"
    $OPT_0="Back"

    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_2" "$OPT_9" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            git pull
        }
        "$OPT_2" {
            if (Test-IsRepository) {
                git add . > $null
                $Message=$(gum input --prompt "Commit Message: " --placeholder "Update dotfiles")
                git commit -m $Message > $null
                git push
            }
            else {
                $SEL_1="Repo not initialized. Init?"
                $SEL_2="Go Back"
    
                $SELECTION=$(gum choose "$SEL_1" "$SEL_2")
    
                switch ($SELECTION) {
                    "$SEL_1" {
                        git init > $null
                        $GIT_ORIGIN=$(gum input --prompt "Repo URL: " --placeholder "git@github.com:excalith/.dotfiles.git")
                        git remote add origin "$GIT_ORIGIN"
                    }
                    "$SEL_" {
                        Show-Sync-Menu
                    }
                }
            }
        }
        "$OPT_9" {
            if (Test-IsRepository) {

            }
            else {
                git init > $null
                $GIT_ORIGIN=$(gum input --prompt "Repo URL: " --placeholder "git@github.com:excalith/.dotfiles.git")
                git remote add origin "$GIT_ORIGIN"
            }
        }
        "$OPT_0" {
            Show-Main-Menu
        }
    }
}

function Show-Help-Menu {
    $OPT_1="Terminal"
    $OPT_0="Back"

    $CHOICE=$(gum choose --height 10 "$OPT_1" "$OPT_0")

    switch ($CHOICE) {
        "$OPT_1" {
            bat $env:USERPROFILE\.dotfiles\bin\dotfiles\win-terminal.txt
        }
        "$OPT_0" {
            Show-Main-Menu
        }
    }
}
Main
