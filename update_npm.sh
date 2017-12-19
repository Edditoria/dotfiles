#!/usr/bin/env bash

# These scripts will update 3 versions of npm via nvm:
# 1. stable
# 2. argon (an alias, corresponding to lts/argon)
# 3. boron (an alias, corresponding to lts/boron)
# Each update will migrate the global packages from previous version
# And then update the alias

function update_npm {
	local local_alias=${1}
	if [ ${1} == "stable" ]; then
		local remote_alias=${1}
	else
		local remote_alias="lts/${1}"
	fi
	echo "======="
	nvm use ${local_alias} # switch to the version being updated
	local installed_version="$(nvm version ${local_alias})"
	local remote_version="$(nvm version-remote ${remote_alias})"

	echo ""
	echo "You are using: ${installed_version}"
	echo "Latest ${remote_alias}: ${remote_version}"
	echo ""

	if [ ${installed_version} == ${remote_version} ]; then
		echo "You are already using the most current stable npm."
		echo "No need to do anything."
	else
		echo "Updating to latest ${remote_alias}..."
		nvm install ${remote_alias} --reinstall-packages-from=${local_alias}
		echo "Update nvm alias:"
		nvm alias ${local_alias} ${remote_version}
	fi
	echo ""
}
update_npm stable
update_npm argon
update_npm boron

echo "======="
echo "Update finish. Here are the npm you are using:"
nvm ls
echo ""
echo "Reminder: You need to manually do \`npm-check -ug\` for each npm"
echo ""
nvm use default
