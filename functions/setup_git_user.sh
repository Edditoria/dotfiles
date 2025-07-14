#!/usr/bin/env bash

function setup_git_user {
	local username
	local email

	if ! command -v git > /dev/null; then
		echo "[${FUNCNAME[0]}()] Cannot find git."
		return 1
	fi

	echo "Please tell me your username and email for git:"
	read -p -r "user.name: " username
	read -p -r "user.email: " email
	git config --global user.name "${username}"
	git config --global user.email "${email}"
}
