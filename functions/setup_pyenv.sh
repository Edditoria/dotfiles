#!/usr/bin/env bash

function setup_pyenv {
	local this_file_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
	local this_repo_dir=$(dirname "$this_file_dir")
	local py_configs_dir="$this_repo_dir/configs/python"
	local req_py2_file="$py_configs_dir/requirements_py2.txt"
	local req_py3_file="$py_configs_dir/requirements_py3.txt"

	# local python2_list python3_list default_python
	source "$this_repo_dir/configs/python/install_lists.sh"

	local eachPython
	for eachPython in "${python2_list[@]}"; do
		pyenv install $eachPython
		pip install --requirement $req_py2_file
	done
	for eachPython in "${python3_list[@]}"; do
		pyenv install $eachPython
		pip install --requirement $req_py3_file
	done
	# pyenv install 3:latest # may install beta version.

	pyenv global $default_python

	echo "[${FUNCNAME[0]}()] pyenv versions:"
	pyenv versions
	echo "[${FUNCNAME[0]}()] pip --version:"
	pip --version
}