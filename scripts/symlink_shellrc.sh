#!/usr/bin/env bash

# IMPORTANT:
# I don't recommend to use this script that symlink the files.
# Instead, append the configs (1) at the end of existing files (2) for each machine.
# However, this script is safe in normal case.
# Do backup your original files!

function symlink_shellrc {
	local this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local this_repo_dir=$(dirname "$this_file_dir")

	if [[ "$(uname -s)" == 'Darwin' ]]; then
		echo "[${FUNCNAME[0]}()] Detected macOS."
		ln -s "$this_repo_dir/configs/shells/macos.sh" "$HOME/.profile"
		ln -s "$this_repo_dir/configs/shells/macos.sh" "$HOME/.bashrc"
	elif [[ "$(uname -s)" == 'Linux' ]]; then
		echo "[${FUNCNAME[0]}()] Detected Linux."
		ln -s "$this_repo_dir/configs/shells/linux_mini.sh" "$HOME/.profile"
		ln -s "$this_repo_dir/configs/shells/linux_mini.sh" "$HOME/.bashrc"
	fi

	echo "[${FUNCNAME[0]}()] Done."
}

symlink_shellrc
