#!/usr/bin/env bash

function setup_git_configs {
	local this_file_dir
	this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local configs_file
	configs_file=$this_file_dir/../configs/git/configure_git_now.sh

	if [ ! -r "$configs_file" ]; then
		echo "[${FUNCNAME[0]}()] Cannot find file: ${configs_file}"
		return 1
	elif ! command -v git > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find git."
		return 1
	fi

	# shellcheck source=./configs/git/configure_git_now.sh
	source "$configs_file"
}
