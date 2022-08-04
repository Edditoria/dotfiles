#!/usr/bin/env bash

if ! which git > /dev/null; then
	echo '[setup:git] Cannot find git.'
	return 1 2> /dev/null || exit 1
fi

( # Subshell start
	this_file_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	echo '[setup:git] Start...'

	# Exclude Github Codespaces
	if [ ! -d "/workspaces/.codespaces/.persistedshare" ]; then
		source $this_file_path/functions/setup_git_user.sh
		setup_git_user
	fi

	source $this_file_path/functions/setup_git_configs.sh
	setup_git_configs
	echo '[setup:git] Done.'
) # Subshell end

# NOTE: Suppose Github Codespaces will run this file at first priority.
