function fcd --description 'Fuzzy CD into directory'
	cd $(tree -dfia -L 1 | fzf)
end

function mkcd --description 'Make directory and cd into it'
  mkdir -pv $argv;
	cd $argv;
end

function ping_pretty 'Pretty pings to target url (defaults to 1.1.1.1)'
    echo ""

    if count $argv = 0 >/dev/null
        prettyping --nolegend "1.1.1.1"
    else
        prettyping --nolegend "$argv"
    end
end

funcsave fcd >/dev/null
funcsave mkcd >/dev/null
funcsave ping_pretty >/dev/null