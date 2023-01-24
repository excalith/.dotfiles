function flushdns --description 'Flush DNS'
    printf "\nFlushing DNS\n"
	switch (uname)
		case Linux
			sudo systemd-resolve --flush-caches
		case Darwin
			dscacheutil -flushcache
	end
end
