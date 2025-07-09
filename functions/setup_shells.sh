#!/usr/bin/env bash

# Definition:
# {DOTFILES_PROFILE} Either {'macOS'|'Linux'|'Linux_mini'|'CodeSpaces'}.

# Make .profile; Symlink .bashrc; Make .bash_profile if need.
# $1 {DOTFILES_PROFILE} As local profile.
# Returns error if profile is invalid.
function setup_shells {
	local profile=$1
	local this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local this_repo_dir=$(dirname "$this_file_dir")

	# Set local src_path; Edit .profile:
	case "$profile" in
		'macOS')
			local src_path="$this_repo_dir/configs/shells/macos.sh"
			touch $HOME/.profile
			printf "\nsource \"${src_path}\"\n" >> $HOME/.profile
			;;
		'Linux' | 'Linux_mini')
			local src_path="$this_repo_dir/configs/shells/linux_mini.sh"
			printf "\n[[ ! \"\$BASH_VERSION\" ]] && source \"${src_path}\"\n" >> $HOME/.profile
			# NOTE: .profile is already sourcing .bash_profile file.
			;;
		'CodeSpaces')
			local src_path="$this_repo_dir/configs/shells/codespaces.sh"
			printf "\n[[ ! \"\$BASH_VERSION\" ]] && source \"${src_path}\"\n" >> $HOME/.profile
			# NOTE: .profile is already sourcing .bash_profile file.
			;;
		*)
			echo "[${FUNCNAME[0]}()] Invalid profile: $profile"
			return 1
			;;
	esac

	# Apply to all profiles:

	touch $HOME/.bashrc
	printf "\nsource \"${src_path}\"\n" >> $HOME/.bashrc

	if [[ -f "$HOME/.bash_profile" ]]; then
		echo "[${FUNCNAME[0]}()] .bash_profile exists but you need to manually edit it, if necessary."
		# printf "\nsource \"${src_path}\"\n" >> $HOME/.bash_profile
	fi
	# If .bash_profile does not exist, do nothing.
}
