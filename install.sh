#!/usr/bin/env bash

if ! which git > /dev/null; then
	echo '[setup:git] Cannot find git.'
	return 1 2> /dev/null || exit 1
fi

( # Subshell start
	this_file_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	echo '[setup:git] Start...'

	# Exclude Github Codespaces
	if [ ! "$CODESPACES" = true ]; then
		source $this_file_path/functions/setup_git_user.sh
		setup_git_user
	fi

	source $this_file_path/functions/setup_git_configs.sh
	setup_git_configs
	echo '[setup:git] Done.'

	# Install apps and cli-tools via Homebrew on macOS:
	if [[ "$(uname -s)" == 'Darwin' ]]; then
		echo '[install:apps] Start...'
		source $this_file_path/functions/setup_homebrew.sh
		setup_homebrew
		echo '[install:apps] Done.'
	fi
) # Subshell end

# NOTE: Suppose Github Codespaces will run this file at first priority.
