function fcd --description 'Fuzzy CD into directory'
	cd $(tree -dfia -L 1 | fzf)
end