# workon-py - work on virtualenvs via subshell
# http://github.com/rafi/workon-py
#
# Copyright (C) 2015-2019 Rafael Bodill <justrafi at gmail>
# Distributed under the GNU General Public License, version 2.0.

cdvirtualenv () {
	cd "$(__workon_prefix)${1}" || echo 'Unable to change directory'
}

__workon_prefix () {
	local envs="${WORKON_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/python/envs}"
	echo "${envs%/}/"
}

__workon_complete () {
	COMPREPLY=()
	local cur="${COMP_WORDS[COMP_CWORD]}"
	prefix="$(__workon_prefix)"

	local IFS=$'\n'
	local items=( $(compgen -d "$prefix$cur") )
	for item in "${items[@]}"; do
		[[ $item == $prefix.* ]] && continue
		COMPREPLY+=("${item#$prefix}")
	done
}

complete -o filenames -o nospace -F __workon_complete workon cdvirtualenv
