#!/usr/bin/env bash

function setup_git_configs {
	local this_file_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local configs_path=$this_file_path/../configs/git.sh

	if [ ! -r "$configs_path" ]; then
		echo "[${FUNCNAME[0]}()] Cannot find file: ${configs_path}"
		return 1
	elif ! which git > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find git."
		return 1
	fi

	source "$this_file_path/../configs/git.sh"
}
