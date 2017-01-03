#!/usr/bin/env bash

echo "Please give me your username and email for git."
read -p "user.name: " username
read -p "user.email: " email
git config --global user.name "$username"
git config --global user.email "$email"

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
if [[ $answer_gitlab =~ ^(Y|y|Yes|yes) ]]; then
  echo "Check your existing SSH key:"
  echo "[\$_\$] cat ~/.ssh/id_rsa.pub..."
  echo ""
  cat ~/.ssh/id_rsa.pub
  echo ""
  read -p "Do you want to create a new key? [Y|n] " answer_new_key
  if [[ $answer_new_key =~ ^(y|yes) ]]; then
    echo "Generating SSH key. Will need a password:" # pwd=s
    ssh-keygen -t rsa -C "$email"
    echo "Here is your SSH key:"
    echo "[\$_\$] cat ~/.ssh/id_rsa.pub..."
    cat ~/.ssh/id_rsa.pub
    pbcopy < ~/.ssh/id_rsa.pub
    read -p "Be ready to paste your key [Cmd + v] in Gitlab.com..." ready
    open https://gitlab.com/profile/keys
  else
    echo "Aborted."
  fi
else
  echo "Aborted."
fi
