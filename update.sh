#!/usr/bin/env bash

# sudo softwareupdate -l -v
sudo softwareupdate -i -a -v
brew -v update
brew upgrade --all
brew cleanup
brew cask update
brew cask cleanup
brew prune
brew doctor
npm install npm -g
npm update -g
sudo gem update --system
sudo gem update --no-document
# (--no-doc and --no-ri is deprecated)
