#!/usr/bin/env bash

# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# $1 {DOTFILES_PROFILE} As local profile.
# Returns error if profile is invalid.
function setup_mise {
	local profile=$1
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	local plugin_script_file=$this_repo_dir/configs/mise/install_plugins_now.sh
	local config_src
	local config_dest="$HOME/.config/mise/config.toml"

	if ! command -v mise > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find mise."
		return 1
	fi

	mkdir -p "$HOME/.config/mise"

	# Install mise plugins

	if [ ! -r "$plugin_script_file" ]; then
		echo "[${FUNCNAME[0]}()] Cannot find file: $plugin_script_file"
		return 1
	fi

	source "$plugin_script_file"

	# Copy config file

	case "$profile" in
		'macOS')
			config_src="$this_repo_dir/configs/mise/macos.toml"
			;;
		'Linux' | 'Linux_mini')
			config_src="$this_repo_dir/configs/mise/linux_mini.toml"
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] Not support CodeSpaces."
			return 1
			;;
		*)
			echo "[${FUNCNAME[0]}()] Invalid profile: $profile"
			return 1
			;;
	esac
	
	if [ ! -f "$config_src" ]; then
		echo "[${FUNCNAME[0]}()] Config source does not exist: $config_src"
		return 1
	fi

	if [ -f "$config_dest" ]; then
		echo "[${FUNCNAME[0]}()] Config file is already exist: $config_dest. Skipped copying."
	else
		cp -f "$config_src" "$config_dest"
	fi

	eval "$(mise activate bash)"
	mise install
}
