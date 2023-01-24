function supdate --description 'Updates fish shell'
    printf "\nUpdating fish\n"
	switch (uname)
		case Linux
			sudo sudo apt upgrade -qqy --fix-missing && sudo apt install --allow-unauthenticated -qqy "fish"
		case Darwin
			brew upgrade fish
	end
end
