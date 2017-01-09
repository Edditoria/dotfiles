#!/usr/bin/env bash

function update_npm {
  LOCAL_ALIAS=$1
  if [ $1 == "stable" ]; then
    REMOTE_ALIAS=$1
  else
    REMOTE_ALIAS="lts/$1"
  fi
  echo "======="
  nvm use $LOCAL_ALIAS # switch to the version being updated
  INSTALLED_VERSION="$(nvm version $LOCAL_ALIAS)"
  REMOTE_VERSION="$(nvm version-remote $REMOTE_ALIAS)"

  echo ""
  echo "You are using: $INSTALLED_VERSION"
  echo "Latest $REMOTE_ALIAS: $REMOTE_VERSION"
  echo ""

  if [ $INSTALLED_VERSION == $REMOTE_VERSION ]; then
    echo "You are already using the most current stable npm."
    echo "No need to do anything."
  else
    echo "Updating to latest $REMOTE_ALIAS..."
    nvm install $REMOTE_ALIAS --reinstall-packages-from=$LOCAL_ALIAS
    echo "Update nvm alias:"
    nvm alias $LOCAL_ALIAS $REMOTE_VERSION
  fi
  echo ""
}

# call the udpate_npm function
update_npm stable
update_npm argon
update_npm boron

echo "======="
echo "Update finish. Here are the npm you are using:"
nvm ls
echo ""
nvm use default
