function treload --description 'Reload TMUX configuration'
    tmux source-file ~/.config/tmux/tmux.conf
    tmux display-message "TMUX Config Reloaded"
end
