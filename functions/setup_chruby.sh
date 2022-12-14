#!/usr/bin/env bash

function setup_chruby {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local ruby_configs_dir="$(dirname $this_file_dir)/configs/ruby"
	local chruby_sh_file="$(brew --prefix chruby)/share/chruby/chruby.sh"

	# local ruby_list, default_ruby and gem_list
	source "$ruby_configs_dir/install_lists.sh"

	local each_ruby
	local each_gem
	for each_ruby in "${ruby_list[@]}"; do
		ruby-install "$each_ruby"
		source "$chruby_sh_file" # since chruby doesn't reload automatically.
		chruby "$each_ruby"
		gem update --system

		# Setup gems
		for each_gem in "${gem_list[@]}"; do
			gem install "$each_gem"
		done
		gem cleanup
	done

	chruby "$default_ruby"
	echo "$default_ruby" > ~/.ruby-version

	echo "[${FUNCNAME[0]}()] chruby versions:"
	chruby
}
