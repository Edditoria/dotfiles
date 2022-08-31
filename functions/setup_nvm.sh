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

	ln -s "$this_repo_dir/configs/node/.default-npm-packages" "$NVM_DIR/default-packages"

	local eachNode
	for eachNode in "${node_list[@]}"; do
		nvm install $eachNode
		nvm alias default $eachNode
	done

	local eachAlias
	for eachAlias in "${alias_list[@]}"; do
		nvm alias $eachAlias
	done

	nvm use default
}
