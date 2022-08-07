#!/usr/bin/env bash

function setup_git_configs {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local configs_file=$this_file_dir/../configs/git.sh

	if [ ! -r "$configs_file" ]; then
		echo "[${FUNCNAME[0]}()] Cannot find file: ${configs_file}"
		return 1
	elif ! command -v git > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find git."
		return 1
	fi

	source "$configs_file"
}
