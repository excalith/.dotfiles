function ping_pretty
    echo ""

    if count $argv = 0 >/dev/null
        prettyping --nolegend "1.1.1.1"
    else
        prettyping --nolegend "$argv"
    end
end
