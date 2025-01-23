#!/usr/bin/env bash

function setup_asdf_nodejs {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	# local node_list default_node
	source "$this_repo_dir/configs/node/install_lists.sh"
	local each_node
	for each_node in "${node_list[@]}"; do
		asdf install nodejs $(asdf nodejs resolve $each_node --latest-available)
	done
	# asdf install nodejs lts # already done in setup_asdf.
	asdf global nodejs $(asdf nodejs resolve $default_node --latest-installed)
}

# NOTE: No need to symlink .default-npm-packages file because the path is set in shells `$ASDF_NPM_DEFAULT_PACKAGES_FILE`.
