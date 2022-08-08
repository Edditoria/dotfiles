#!/usr/bin/env bash

function setup_ruby {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local configs_dir="$(dirname $this_file_dir)/configs/ruby"

	ln -s "$configs_dir/.gemrc" "$HOME/.gemrc"
	mkdir -p ~/.bundle
	ln -s "$configs_dir/.bundle_config" "$HOME/.bundle/config"
	# NOTE: "config" is a file.
}
