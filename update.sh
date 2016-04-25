#!/usr/bin/env bash

# update apps from Mac AppStore
sudo softwareupdate -l -v
read -p "update apps from Mac AppStore now? [Y|n] " input_macapp
if [[ $input_macapp =~ ^(Y|y|Yes|yes) ]]; then
  sudo softwareupdate -i -a -v
else
  echo "Skipped update from Mac App Store"
fi

echo "Updating brew, cask goodies and gems"
brew -v update
brew upgrade --all
brew cleanup
brew cask update
brew cask cleanup
brew prune
brew doctor

# should use nvm to upgrade
# e.g. nvm install v0.12.7 --reinstall-packages-from=0.12.6
# npm install npm -g
# npm update -g
sudo gem update --system
sudo gem update --no-document
# (--no-doc and --no-ri is deprecated)
