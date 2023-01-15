function ping_pretty --description 'Pretty pings to target url (defaults to 1.1.1.1)'
    echo ""

    if count $argv = 0 >/dev/null
        prettyping --nolegend "1.1.1.1"
    else
        prettyping --nolegend "$argv"
    end
end
