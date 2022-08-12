#!/usr/bin/env bash

# This function will find the file in "$DOTFILES/configs/terminal/".
# Then add to profile list in Terminal.
# Credit: https://github.com/ymendel/dotfiles/blob/master/osx/terminal.defaults
#
# $1 {String} Filename of the Terminal setting, e.g. 'WWDC16_Dark_Customized'.
# $2 {Boolean} Optional. `true` to set the profile as default.
function setup_macos_terminal {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local profile_name="${1%.terminal}"
	local profile_dir="$this_file_dir/../configs/terminal"
	local profile_file="${1%.terminal}.terminal" # Add extension name if omitted
	local shouldSetDefault=${2:-false}

	if  [[ ! "$(uname -s)" == 'Darwin' ]]; then
		echo "[${FUNCNAME[0]}()] Not macOS :("
		return 1
	fi

	# echo "Theme name: $profile_name"
	# echo "File: $profile_dir/$profile_name"
	if [[ ! -r "$profile_dir/$profile_file" ]]; then
		echo "[${FUNCNAME[0]}()] File not found."
		return 1
	fi

	open "$profile_dir/$profile_file"
	sleep 2  # to make sure the theme is loaded.
	if [ "$shouldSetDefault" = true ]; then
		defaults write com.apple.Terminal "Default Window Settings" -string "$profile_name"
		defaults write com.apple.Terminal "Startup Window Settings" -string "$profile_name"
	fi
}
