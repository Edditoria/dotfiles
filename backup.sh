#!/usr/bin/env bash

# These scripts will backup the "lists" of:
# - npm packages in nvm: stable, argon and boron (not lts/*)
# - Homebrew leaves
# - Cask apps
# - Mac apps (excludes Cask apps)
# - login items

set -e

hline="-------"

dotfiles_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)
backup_dir="${dotfiles_dir}/backup"

# backup procedure starts

function backup_npm {
	local this_ver=${1}
	nvm use ${this_ver}
	npm ls -g --depth=0 --json > "${backup_dir}/npm_ls_g_${this_ver}.json"
	echo "# Test: read npm global packages file (${this_ver})"
	echo ${hline}
	cat "${backup_dir}/npm_ls_g_${this_ver}.json"
	echo " "
}
backup_npm stable
backup_npm argon
backup_npm boron
backup_npm carbon
backup_npm dubnium

echo $( brew leaves ) > "${backup_dir}/brew_leaves.txt"
echo "# Test: read Brew leaves txt file"
echo ${hline}
cat "${backup_dir}/brew_leaves.txt"
echo " "

echo $( brew cask list ) > "${backup_dir}/brew_cask_list.txt"
echo "# Test: read Cask apps txt file"
echo ${hline}
cat "${backup_dir}/brew_cask_list.txt"
echo " "

ls /Applications > "${backup_dir}/app_list.txt"
echo "# Test: read all apps list txt file"
echo ${hline}
cat "${backup_dir}/app_list.txt"
echo " "

osascript -e 'tell application "System Events" to get the name of every login item' > "${backup_dir}/login_items.txt"
echo "# Test: read login items txt file"
echo ${hline}
cat "${backup_dir}/login_items.txt"
echo " "
