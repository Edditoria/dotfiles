#!/usr/bin/env bash

nvm use stable # make sure for current bash

INSTALLED="$(nvm version stable)"
REMOTE="$(nvm version-remote stable)" #todo

echo ""
echo "You are using: $INSTALLED"
echo "Latest stable: $REMOTE"
echo ""

if [ $INSTALLED == $REMOTE ]; then
  echo "You are already using the most current stable npm."
  echo "No need to do anything."
else
  echo "Updating for you..."
  nvm install stable --reinstall-packages-from=stable
fi

echo ""
echo "Here are the npm you are using:"
nvm ls

nvm use default
