#!/usr/bin/env bash

function setup_micro {
	local this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local this_repo_dir=$(dirname "$this_file_dir")
	# local plugin_list
	source "$this_repo_dir/configs/micro/plugin_list.sh"

	mkdir -p "$HOME/.config/micro"
	ln -s "$this_repo_dir/configs/micro/bindings.json" "$HOME/.config/micro/bindings.json"
	ln -s "$this_repo_dir/configs/micro/settings.json" "$HOME/.config/micro/settings.json"
	micro -plugin install "${plugin_list[@]}"
}
