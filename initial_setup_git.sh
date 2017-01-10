#!/usr/bin/env bash

# These scripts will initial setup global config of git
# And then set osxkeychain for Github login (but will not login yet)
# And then set SSH key for Gitlab account (will open your default browser)

echo "Please give me your username and email for git."
read -p "user.name: " username
read -p "user.email: " email
git config --global user.name "${username}"
git config --global user.email "${email}"
git config --global color.ui true

# For macOS only
git config --global credential.helper osxkeychain

echo "======="
echo "Done! Here is the config list:"
echo ""
git config --list --global
echo "======="
echo ""

# Setup Gitlab

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
  echo "[\$_\$] ssh -T git@github.com"
  ssh -T git@github.com
  echo "[\$_\$] ssh -T git@gitlab.com"
  ssh -T git@gitlab.com
else
  echo "Aborted."
fi
