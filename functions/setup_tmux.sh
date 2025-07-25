#!/usr/bin/env bash

function setup_tmux {
	local this_file_dir
	this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local this_repo_dir
	this_repo_dir=$(dirname "$this_file_dir")

	mkdir -p "$HOME/.config/tmux"
	ln -s "$this_repo_dir/configs/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
}
