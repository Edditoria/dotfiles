#!/usr/bin/env bash

# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# $1 {DOTFILES_PROFILE} As local profile.
# Returns error if profile is invalid.
function setup_homebrew {
	local profile=$1
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local configs_dir=$this_file_dir/../configs/homebrew

	case "$profile" in
		'macOS')
			if ! command -v brew > /dev/null; then
				echo "[${FUNCNAME[0]}()] Cannot find Homebrew."
				return 1
			fi
			brew bundle --file="$configs_dir/asap.brewfile"
			brew bundle --file="$configs_dir/essentials.brewfile"
			brew bundle --file="$configs_dir/sometimes.brewfile"

			;;
		'Linux' | 'Linux_mini')
			if ! command -v brew > /dev/null; then
				echo "[${FUNCNAME[0]}()] Cannot find Homebrew."
				return 1
			fi
			brew bundle --file="$configs_dir/linux.brewfile"
			;;
		'CodeSpaces')
			echo "[${FUNCNAME[0]}()] Not support $profile currently."
			return 1
			;;
		*)
			echo "[${FUNCNAME[0]}()] Invalid profile: $profile."
			return 1
			;;
	esac
}

