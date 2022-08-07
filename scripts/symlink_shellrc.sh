#!/usr/bin/env bash

# IMPORTANT:
# I don't recommend to use this script that symlink the files.
# Instead, append the configs (1) at the end of existing files (2) for each machine.
# However, this script is safe in normal case.
# Do backup your original files!

function symlink_shellrc {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

	if [[ "$(uname -s)" == 'Darwin' ]]; then
		echo "[${FUNCNAME[0]}()] Detected macOS."
		ln -s "$this_file_dir/../examples/macos/.profile" "$HOME/.profile"
		ln -s "$this_file_dir/../examples/macos/.profile" "$HOME/.bashrc"
	elif [[ "$(uname -s)" == 'Linux' ]]; then
		echo "[${FUNCNAME[0]}()] Detected Linux."
		ln -s "$this_file_dir/../examples/linux_mini/.profile" "$HOME/.profile"
		ln -s "$this_file_dir/../examples/linux_mini/.profile" "$HOME/.bashrc"
	fi

	echo "[${FUNCNAME[0]}()] Done."
}

symlink_shellrc
