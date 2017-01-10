#!/usr/bin/env bash

echo "Updating brew and cask goodies"
brew -v update
brew upgrade # --all is default in latest brew
brew cleanup
brew cask update
brew cask cleanup
brew prune
brew doctor
