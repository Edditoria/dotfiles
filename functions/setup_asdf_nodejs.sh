#!/usr/bin/env bash

function setup_asdf_nodejs {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	# local node_list default_node
	source "$this_repo_dir/configs/node/node_list.sh"
	local eachNode
	for eachNode in "${node_list[@]}"; do
		# Replace '/' with '-'
		asdf install nodejs "${eachNode/\//-}"
	done
	# asdf install nodejs lts # already done in setup_asdf.
	asdf global nodejs $default_node
}

# NOTE: No need to symlink .default-npm-packages file because the path is set in shells `$ASDF_NPM_DEFAULT_PACKAGES_FILE`.
