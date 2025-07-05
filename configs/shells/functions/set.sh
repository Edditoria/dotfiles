function set_flutter {
	# Fix path not found in editors, e.g. VSCode
	if command -v flutter >/dev/null; then
		if mise which flutter 1>/dev/null 2>/dev/null; then
			export FLUTTER_ROOT="$(mise where flutter)"
		fi
	fi
}

function set_prompt_style {
	if [[ "$(uname -s)" == 'Darwin' ]]; then
		# colorize Terminal for Novel theme
		export CLICOLOR=1
		# export LSCOLORS=exfxcxdxbxegedabagacad # default
		export PS1="\n\[$(tput setaf 6)\]\u\[$(tput sgr0)\]@\[$(tput setaf 6)\]\h\[$(tput sgr0)\] in \[$(tput setaf 4)\]\W\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"
	else
		# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' # default
		PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
	fi
}
