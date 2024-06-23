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
        gping 1.1.1.1
    else
        gping $argv
    end
end

function supdate --description 'Update fish shell and starship prompt'
    apt upgrade -qqy --fix-missing
    and apt install --allow-unauthenticated -qqy "fish"
    and apt install --allow-unauthenticated -qqy "starship"
end

function sreload --description 'Reloads fish configs'
    . $HOME/.config/fish/config.fish
end

function duptate --description 'Update dotfiles contents from source'
    bash -c "$(curl -LsS https://raw.github.com/excalith/.dotfiles/main/system/lite/install.sh)"
end

starship init fish | source
