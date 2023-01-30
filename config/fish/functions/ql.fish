function ql --description 'Quicklook for file'
	switch (uname)
		case Linux
			printf "Not implemented yet!\n"
		case Darwin
			qlmanage -p $argv[1] >/dev/null 2>/dev/null &
	end
end
