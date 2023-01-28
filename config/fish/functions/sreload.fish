function sreload --description 'Reloads fish configs'
    . ~/.config/fish/config.fish
    tmux display-message "Fish Shell Config Reloaded"
end
