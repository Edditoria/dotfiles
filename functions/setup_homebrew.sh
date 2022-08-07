#!/usr/bin/env bash

function setup_homebrew {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local configs_dir=$this_file_dir/../configs/homebrew

	if ! command -v brew > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find Homebrew."
		return 1
	fi

	brew bundle --file="$configs_dir/asap.brewfile"
	brew bundle --file="$configs_dir/essentials.brewfile"
	brew bundle --file="$configs_dir/sometimes.brewfile"
}

