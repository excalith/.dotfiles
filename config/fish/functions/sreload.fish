function sreload --description 'Reloads fish configs'
    . ~/.config/fish/config.fish
    . ~/.config/fish/export.fish
    . ~/.config/fish/bindings.fish
    tmux display-message "Fish Shell Config Reloaded"
end
