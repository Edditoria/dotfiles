#!/usr/bin/env bash

# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# Make .profile; Symlink .bashrc; Make .bash_profile if need.
# $1 {DOTFILES_PROFILE} As local profile.
# Returns error if profile is invalid.
function setup_dotfiles {
	local profile=$1
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	# Set local src_path
	case "$profile" in
		'macOS')
			local src_path="$this_repo_dir/configs/shells/macos.sh"
			;;
		'Linux' | 'Linux_mini')
			local src_path="$this_repo_dir/configs/shells/linux_mini.sh"
			;;
		'CodeSpaces')
			local src_path="$this_repo_dir/configs/shells/codespaces.sh"
			;;
		*)
			echo "[${FUNCNAME[0]}()] Invalid profile: $profile"
			return 1
			;;
	esac

	touch $HOME/.profile
	printf "\nsource \"${src_path}\"\n" >> $HOME/.profile

	touch $HOME/.bashrc
	printf "\nsource \"${src_path}\"\n" >> $HOME/.bashrc

	if [[ -f "$HOME/.bash_profile" ]]; then
		printf "\nsource \"${src_path}\"\n" >> $HOME/.bashrc
	fi
	# If .bash_profile does not exist, do nothing.
}
