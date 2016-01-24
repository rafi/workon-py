# workon-py - work on virtualenvs via subshell
# http://github.com/rafi/workon-py
#
# Copyright (C) 2015-2016 Rafael Bodill <justrafi at gmail>
# Distributed under the GNU General Public License, version 2.0.

cdvirtualenv () {
	cd "$(_workon_prefix)${1}"
}

_workon_prefix () {
	local envs="${WORKON_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/python/envs}"
	echo "${envs%/}/"
}

_workon_complete () {
	COMPREPLY=()
	local cur="${COMP_WORDS[COMP_CWORD]}"
	prefix="$(_workon_prefix)"

	local IFS=$'\n'
	local items=($(compgen -d $prefix$cur))
	for item in ${items[@]}; do
		[[ $item == $prefix.* ]] && continue
		COMPREPLY+=("${item#$prefix}")
	done
}

complete -o filenames -o nospace -F _workon_complete workon cdvirtualenv
