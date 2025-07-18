#!/usr/bin/env bash

function setup_ruby {
	local this_file_dir
	this_file_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
	local ruby_configs_dir
	ruby_configs_dir="$(dirname "$this_file_dir")/configs/ruby"

	ln -s "$ruby_configs_dir/gemrc.yaml" "$HOME/.gemrc"
	mkdir -p ~/.bundle
	ln -s "$ruby_configs_dir/bundle_config.yaml" "$HOME/.bundle/config"
	# NOTE: "config" is a file.
}
