#!/usr/bin/env bash

# These scripts will set SSH key for Gitlab account (will open your default browser)

read -p "Do you want to setup SSH key for Gitlab? (need an account) [Y|n] " answer_gitlab
if [[ ${answer_gitlab} =~ ^(Y|y|Yes|yes) ]]; then
	echo "Check your existing SSH key:"
	echo "[\$_\$] cat ~/.ssh/id_rsa.pub..."
	echo ""
	cat ~/.ssh/id_rsa.pub
	echo ""
	read -p "Do you want to create a new key? [Y|n] " answer_new_key
	if [[ ${answer_new_key} =~ ^(Y|y|Yes|yes) ]]; then
		echo "Generating SSH key. Will need a password:" # pwd=s
		ssh-keygen -t rsa -C "${email}"
		echo "Here is your SSH key:"
		echo "[\$_\$] cat ~/.ssh/id_rsa.pub..."
		cat ~/.ssh/id_rsa.pub
		pbcopy < ~/.ssh/id_rsa.pub
		echo "[^_^] Be ready to paste your key [Cmd + v] in Gitlab.com; Save; Then come back."
		read -p "Ready? (press any key to open Gitlab web page)" ready
		open https://gitlab.com/profile/keys
		read -p "Welcome back. (press any key for next step)" ready
	else
		echo "Aborted."
	fi
	echo "[\$_\$] ssh -T git@gitlab.com"
	ssh -T git@gitlab.com
else
	echo "Aborted."
fi
