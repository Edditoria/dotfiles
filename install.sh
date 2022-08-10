#!/usr/bin/env bash

# Simple Health Check
# =================

# Do what Homebrew does:
if [ -z "${BASH_VERSION:-}" ]; then
	echo '[dotfiles:install] Require Bash to run this script.'
	return 1 2> /dev/null || exit 1
fi
if [[ -n "${CI-}" && -n "${INTERACTIVE-}" ]]; then
	echo '[dotfiles:install] Cannot run force-interactive mode in CI.'
	return 1 2> /dev/null || exit 1
fi
if [[ -n "${INTERACTIVE-}" && -n "${NONINTERACTIVE-}" ]]; then
	echo '[dotfiles:install] Both `$INTERACTIVE` and `$NONINTERACTIVE` are set. Please unset at least one variable and try again.'
	return 1 2> /dev/null || exit 1
fi
# Thanks Homebrew team!

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
	machine_type='not_supported'
	if [[ "$CODESPACES" == true ]]; then
		machine_type='CodeSpaces'
	elif [[ "$(uname -s)" == 'Darwin' ]]; then
		machine_type='macOS'
	elif [[ "$(uname -s)" == 'Linux' ]]; then
		machine_type='Linux'
	else
		echo "[dotfiles:install] Machine type not supported: $(uname -s)"
		return 1 2> /dev/null || exit 1
	fi

	# Setup git

	echo '[setup:git] Start...'
	# CodeSpaces already set user in `--system`.
	if [[ "$machine_type" != 'CodeSpaces' ]]; then
		source $this_file_dir/functions/setup_git_user.sh
		setup_git_user
	fi
	source $this_file_dir/functions/setup_git_configs.sh
	setup_git_configs
	echo '[setup:git] Done.'

	# Install apps and cli-tools via Homebrew

	if [[ "$machine_type" == 'macOS' ]]; then
		echo '[install:apps] Start...'
		source $this_file_dir/functions/setup_homebrew.sh
		setup_homebrew
		echo '[install:apps] Done.'
	fi

	# Setup Node env

	if [[ "$machine_type" == 'CodeSpaces' ]]; then
		source "$this_file_dir/functions/setup_nvm.sh"
		setup_nvm
	fi

	# Setup Ruby env

	source $this_file_dir/functions/setup_ruby.sh
	setup_ruby

) # Subshell end

# NOTE: Suppose Github Codespaces will run this file at first priority.
