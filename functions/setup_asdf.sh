#!/usr/bin/env bash

# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# $1 {DOTFILES_PROFILE} As local profile.
# Returns error if profile is invalid.
function setup_asdf {
	local profile=$1
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	# Symlink: Apply to all profiles.
	# ln -s "$this_repo_dir/configs/asdf/.asdfrc" "$HOME/.asdfrc"
	# NOTE: Path is set in shell $ASDF_CONFIG_FILE

	case "$profile" in
		'macOS')
			source "$this_repo_dir/configs/asdf/macos.sh"
			if [[ "$asdf_updates_disabled" == true ]]; then
				touch "$HOME/.asdf/asdf_updates_disabled"
			fi
			;;
		'Linux' | 'Linux_mini')
			source "$this_repo_dir/configs/asdf/linux_mini.sh"
			if [[ "$asdf_updates_disabled" == true ]]; then
				touch "$HOME/.asdf/asdf_updates_disabled"
			fi
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

	# Setup plugins
	local each_plugin
	for each_plugin in "${plugin_list[@]}"; do
		asdf plugin add "$each_plugin"
	done
	asdf plugin update --all

	# Install versions
	local each_install
	for each_install in "${init_install_list[@]}"; do
		asdf install "$each_install"
	done
}
