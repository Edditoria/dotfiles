#!/usr/bin/env bash

echo "Updating brew, cask goodies"
brew -v update
brew upgrade # --all is default in latest brew
brew cleanup
brew cask update
brew cask cleanup
brew prune
brew doctor

# echo "Updating gems"
# sudo gem update --system
# sudo gem update --no-document
# (--no-doc and --no-ri is deprecated)
