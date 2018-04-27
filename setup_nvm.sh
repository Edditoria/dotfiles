#!/usr/bin/env bash

# These scripts will install npm via nvm for you.
# node versions include:
# 1. latest stable
# 2. latest argon
# 3. latest boron
# 4. latest carbon
# Then, nvm alias: "argon" to latest argon, and "boron" to latest boron
# Then, npm alias default boron
# !important: alias will be used for update_brew.sh in future

nvm install stable

node_list=(
	"argon"
	"boron"
	"carbon"
)
for node in "${node_list[@]}"; do
	nvm install lts/$node
	nvm alias $node $(nvm version lts/$node) # for better control, and type faster
done

nvm alias default carbon
nvm use carbon
