#!/usr/bin/env bash

nvm use stable # make sure for current bash
INSTALLED="$(nvm current)"
REMOTE="$(nvm ls-remote stable)"

echo "$INSTALLED"
echo "$REMOTE"

if [ $INSTALLED == $REMOTE ]; then
  echo "You are already using the most current stable npm."
  echo "No need to do anything."
else
  echo "The current version you are using: $INSTALLED"
  echo "The latest stable version available : $REMOTE"
  echo "Updating for you..."
  nvm install stable --reinstall-packages-from=stable
fi
# note: lts should be maintained manually
echo "Here are the npm you are using:"
nvm ls
