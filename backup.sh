#!/usr/bin/env bash

# These scripts will backup the "lists" of:
# - npm packages in nvm: stable, argon and boron (not lts/*)
# - app settings:
#   - apm (atom)
# - Homebrew leaves
# - Cask apps
# - Mac apps (excludes Cask apps)
# - login items

set -e

hline="-------"

# get current dir
dotfiles_dir="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"
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

echo $( apm list --installed --bare ) > "${backup_dir}/apm_list.json"
echo "# Test: read apm packages file"
echo ${hline}
cat "${backup_dir}/apm_list.json"
echo " "

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
