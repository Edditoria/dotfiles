#!/usr/bin/env bash

function setup_ruby {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local ruby_configs_dir="$(dirname $this_file_dir)/configs/ruby"

	# local ruby_list
	source "$ruby_configs_dir/install_lists.sh"

	mkdir -p "$(rbenv root)/plugins"

	for each_ruby in "${ruby_list[@]}"; do
		rbenv install "$each_ruby"
		gem update --system
		gem update bundler
		gem cleanup
		rbenv rehash
	done

	rbenv global "$default_ruby"

	echo "[${FUNCNAME[0]}()] rbenv versions:"
	rbenv versions
	echo "[${FUNCNAME[0]}()] rbenv which bundle:"
	rbenv which bundle
}
