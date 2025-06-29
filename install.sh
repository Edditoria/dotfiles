#!/usr/bin/env bash

# Require: User account, machine name and localhost are set.
# Require: bash, XCode (macOS), git and Homebrew are properly installed.
# NOTE: Suppose Github Codespaces will run this file at first priority.

# Simple Health Check
# ===================

echo '[dotfiles:install] Start...'
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

if [[ "$CODESPACES" == true ]]; then
	echo ''
	# TODO: More health check...
elif [[ "$(uname -s)" == 'Darwin' ]]; then
	if ! command -v brew > /dev/null; then
		echo '[dotfiles:install] Cannot find Homebrew.'
		return 1 2> /dev/null || exit 1
	fi
	# TODO: More health check...
elif [[ "$(uname -s)" == 'Linux' ]]; then
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
	dotfiles_profile='not_supported'
	if [[ "$CODESPACES" == true ]]; then
		dotfiles_profile='CodeSpaces'
	elif [[ "$(uname -s)" == 'Darwin' ]]; then
		dotfiles_profile='macOS'
	elif [[ "$(uname -s)" == 'Linux' ]]; then
		dotfiles_profile='Linux'
	else
		echo "[dotfiles:install] Machine type not supported: $(uname -s)"
		return 1 2> /dev/null || exit 1
	fi

	# Setup git

	echo '[setup:git] Start...'
	# CodeSpaces already set user in `--system`.
	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		source $this_file_dir/functions/setup_git_user.sh
		setup_git_user
	fi
	source $this_file_dir/functions/setup_git_configs.sh
	setup_git_configs
	echo '[setup:git] Done.'

	# Setup shells: bash

	echo '[setup:shells] Start...'
	source "$this_file_dir/functions/setup_shells.sh"
	setup_shells $dotfiles_profile
	echo '[setup:shells] Done.'

	# Install apps and cli-tools via Homebrew

	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		echo '[install:apps] Start...'
		source $this_file_dir/functions/setup_homebrew.sh
		setup_homebrew $dotfiles_profile
		echo '[install:apps] Done.'
	fi

	# Setup mise

	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		echo '[setup:mise] Start...'
		source $this_file_dir/functions/setup_mise.sh
		setup_mise $dotfiles_profile
		echo '[setup:mise] Done.'
	fi

	# Setup Node env

	if [[ "$dotfiles_profile" == 'CodeSpaces' ]]; then
		echo '[setup:node] Start...'
		source "$this_file_dir/functions/setup_nvm.sh"
		setup_nvm
		echo '[setup:node] Done.'
	fi

	# Setup Ruby env

	echo '[setup:ruby] Start...'
	source $this_file_dir/functions/setup_ruby.sh
	setup_ruby
	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		source $this_file_dir/functions/setup_chruby.sh
		setup_chruby
	fi
	echo '[setup:ruby] Done.'

	# Setup tmux
	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		echo '[setup:tmux] Start...'
		source "$this_file_dir/functions/setup_tmux.sh"
		setup_tmux
		echo '[setup:tmux] Done.'
	fi

	# Setup micro-editor
	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		echo '[setup:micro] Start...'
		source "$this_file_dir/functions/setup_micro.sh"
		setup_micro
		echo '[setup:micro] Done.'
	fi

	# Setup Vim
	if [[ "$dotfiles_profile" != 'CodeSpaces' ]]; then
		echo '[setup:vim] Start...'
		source "$this_file_dir/functions/setup_vim.sh"
		setup_vim
		echo '[setup:vim] Done.'
	fi

) # Subshell end

echo '[dotfiles:install] Done.'
