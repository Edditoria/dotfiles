# Initiate asdf (includes node, python, etc.).
# $1 {DOTFILES_PROFILE} : As local profile. Required.
function init_asdf {
	local profile=$1
	case "$profile" in
		'macOS')
			if [[ -s $(brew --prefix asdf)/libexec/asdf.sh ]]; then
				source $(brew --prefix asdf)/libexec/asdf.sh
				source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
			else
				echo "[${FUNCNAME[0]}()] Cannot find asdf."
			fi
			;;
		'Linux' | 'Linux_mini')
			if [[ -f $HOME/apps/asdf/asdf.sh ]]; then
				source $HOME/apps/asdf/asdf.sh
			else
				echo "[${FUNCNAME[0]}()] Cannot find asdf."
			fi
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] Suppose won't install asdf on CodeSpaces."
			;;
		*)
			echo "[${FUNCNAME[0]}()] Unknown \$profile: $profile"
			;;
	esac
}

# Initiate nvm for node.
# $1 {DOTFILES_PROFILE} : As local profile. Required.
function init_nvm {
	local profile=$1
	case "$1" in
		'macOS')
			if [[ -s $(brew --prefix nvm)/nvm.sh ]]; then
				source $(brew --prefix nvm)/nvm.sh
				source $(brew --prefix nvm)/etc/bash_completion.d/nvm
			else
				echo "[${FUNCNAME[0]}()] Cannot find nvm."
			fi
			;;
		'Linux' | 'Linux_mini')
			if [[ -s "$NVM_DIR/nvm.sh" ]]; then
				source "$NVM_DIR/nvm.sh"
			else
				echo "[${FUNCNAME[0]}()] Cannot find nvm.sh file."
			fi
			if [[ -s "$NVM_DIR/bash_completion" ]]; then
				source "$NVM_DIR/bash_completion"
			else
				echo "[${FUNCNAME[0]}()] Cannot find bash_completion of nvm."
			fi
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] CodesSpaces implements \"NVS\"."
			;;
		*)
			echo "[${FUNCNAME[0]}()] Unknown \$profile: $profile"
			;;
	esac
}

# Initiate rbenv for ruby.
# $1 {DOTFILES_PROFILE} : As local profile. Required.
function init_rbenv {
	local profile=$1
	case "$profile" in
		'macOS' | 'Linux' | 'Linux_mini')
			if which rbenv > /dev/null; then
				eval "$(rbenv init -)"
			else
				echo "[${FUNCNAME[0]}()] Cannot find rbenv."
			fi
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] CodesSpaces had already done it for you."
			;;
		*)
			echo "[${FUNCNAME[0]}()] Unknown \$profile: $profile"
			;;
	esac
}

# Initiate pyenv for python.
# $1 {DOTFILES_PROFILE} : As local profile. Required.
function init_pyenv {
	local profile=$1
	case "$profile" in
		'macOS' | 'Linux' | 'Linux_mini')
			if which pyenv > /dev/null; then
				eval "$(pyenv init -)"
			else
				echo '[x_x] Cannot find pyenv.'
			fi
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] CodesSpaces had in its own way to run Python."
			;;
		*)
			echo "[${FUNCNAME[0]}()] Unknown \$profile: $profile"
			;;
	esac
}
