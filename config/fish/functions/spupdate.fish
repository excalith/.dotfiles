function spupdate --description 'Updates starship shell prompt'
    printf "\nUpdating starfish\n"
	switch (uname)
		case Linux
			curl -sS https://starship.rs/install.sh | sh
		case Darwin
			brew upgrade starship
	end
end
