#!/usr/bin/env bash

# Simple Health Check
# =================

if ! command -v git > /dev/null; then
	echo '[dotfiles:install] Cannot find git.'
	return 1 2> /dev/null || exit 1
fi
if [[ "$(uname -s)" == 'Darwin' ]]; then
	if ! command -v brew > /dev/null; then
		echo '[dotfiles:install] Cannot find Homebrew.'
		return 1 2> /dev/null || exit 1
	fi
	# TODO: More health check...
fi


# Let's Get It Started
# ====================

( # Subshell start
	this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

	echo '[setup:git] Start...'
	# Exclude Github Codespaces
	if [ ! "$CODESPACES" = true ]; then
		source $this_file_dir/functions/setup_git_user.sh
		setup_git_user
	fi
	source $this_file_dir/functions/setup_git_configs.sh
	setup_git_configs
	echo '[setup:git] Done.'

	# Install apps and cli-tools via Homebrew on macOS:
	if [[ "$(uname -s)" == 'Darwin' ]]; then
		echo '[install:apps] Start...'
		source $this_file_dir/functions/setup_homebrew.sh
		setup_homebrew
		echo '[install:apps] Done.'
	fi
) # Subshell end

# NOTE: Suppose Github Codespaces will run this file at first priority.
