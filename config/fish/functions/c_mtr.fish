function c_mtr --description 'Traceroute to target url (defaults to 1.1.1.1)'
    echo ""
    if not set -q argv[1]
        sudo mtr "1.1.1.1"
    else
        sudo mtr "$argv"
    end
end
