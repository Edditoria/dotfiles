#!/usr/bin/env bash

# These scripts will install npm via nvm for you.
# node versions include:
# 1. latest stable
# 2. latest argon
# 3. latest boron
# 4. latest carbon
# 5. latest dubnium
# Then, nvm alias: "argon" to latest argon, and "boron" to latest boron
# Then, npm alias default boron
# For each versions, global packages will be installed
# !important: alias will be used for update_brew.sh in future

# get current dir
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

npm_list_file="$dotfiles_dir/data/npm_list.txt"
source $dotfiles_dir/utils/run_by_line.sh

nvm install stable
# nvm auto switch to stable. Nice!
run_by_line "npm install --global" $npm_list_file

node_list=(
	"argon"
	"boron"
	"carbon"
	"dubnium"
)
for node in "${node_list[@]}"; do
	nvm install lts/$node
	# nvm auto switch to this version. Nice!
	nvm alias $node $(nvm version lts/$node) # for better control, and type faster
	run_by_line "npm install --global" $npm_list_file
done

nvm alias default dubnium
nvm use dubnium
