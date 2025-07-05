#!/usr/bin/env bash

function setup_nvm {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")

	if [ -z "${NVM_DIR:-}" ]; then
		echo "[${FUNCNAME[0]}()] \$NVM_DIR not set."
		return 1
	fi

	# local node_list alias_list
	source "$this_repo_dir/configs/node/install_lists.sh"

	ln -s "$this_repo_dir/configs/node/default_npm_packages.conf" "$NVM_DIR/default-packages"

	local each_node
	for each_node in "${node_list[@]}"; do
		nvm install "$each_node"
		nvm alias default "$each_node"
	done

	local each_alias
	for each_alias in "${alias_list[@]}"; do
		nvm alias "$each_alias"
	done

	nvm use default
}
