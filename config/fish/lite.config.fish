function fcd --description "Fuzzy CD into a directory"
  cd $(find . -type d -print | fzf)
end

function mkcd --description "Create and cd to directory"
  mkdir $argv
  and cd $argv
end

function pingp --description 'Pretty pings to target url (defaults to 1.1.1.1)'
    echo ""
    if not set -q argv[1]
        prettyping --nolegend "1.1.1.1"
    else
        prettyping --nolegend "$argv"
    end
end

function pingg --description 'Pretty pings to target url (defaults to 1.1.1.1)'
    echo ""
    if not set -q argv[1]
        gping "1.1.1.1"
    else
        gping "$argv"
    end
end

function supdate --description 'Update fish shell and starship prompt'
    printf "\nRunning apt upgrade"
    apt upgrade -qqy --fix-missing
    
    printf "\n\n"
    printf "\Updating fish shell\n"
    apt install --allow-unauthenticated -qqy "fish"
    
    printf "\n\n"
    printf "\Updating starship prompt\n"
    apt install --allow-unauthenticated -qqy "starship"
end


function sreload --description 'Reloads fish configs'
    . ~/.config/fish/config.fish
end

starship init fish | source
