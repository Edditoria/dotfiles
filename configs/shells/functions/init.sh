# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# Initiate fzf
function init_fzf {
	if command -v fzf >/dev/null; then
		eval "$(fzf --bash)"
	else
		echo '[x_x] Cannot find fzf.'
	fi
}

# Initiate mise.
function init_mise {
	if command -v mise >/dev/null; then
		eval "$(mise activate bash)"
	else
		echo '[x_x] Cannot find mise.'
	fi
}

# Initiate asdf (includes node, python, etc.).
# $1 {DOTFILES_PROFILE} As local profile.
function init_asdf {
	local profile=$1

	export ASDF_CONFIG_FILE="$DOTFILES/configs/asdf/asdfrc"
	export ASDF_NPM_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/node/default_npm_packages.conf"
	export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_installed"
	export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/python/default_python_packages.conf"
	export ASDF_GOLANG_MOD_VERSION_ENABLED=true
	export ASDF_GOLANG_DEFAULT_PACKAGES_FILE="$DOTFILES/configs/golang/default_golang_packages.asdf.rc"

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
# $1 {DOTFILES_PROFILE} As local profile.
function init_nvm {
	local profile=$1
	case "$profile" in
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
