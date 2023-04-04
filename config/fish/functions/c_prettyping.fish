function c_prettyping --description 'Pretty pings to target url (defaults to 1.1.1.1)'
    echo ""
    if not set -q argv[1]
        prettyping --nolegend "1.1.1.1"
    else
        prettyping --nolegend "$argv"
    end
end
