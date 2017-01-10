#!/usr/bin/env bash

# These scripts will install brew formulae and Cask apps

# get current dir
dotfiles_dir="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="$dotfiles_dir/backup"

# update Homebrew and formulae
brew -v update
brew upgrade # --all is default in latest brew

# install brew formulae
brew install $(cat "$backup_dir/brew_leaves.txt")

# add Cask repo to Homebrew
brew tap caskroom/cask
brew tap caskroom/fonts

# install cask apps
brew cask install $(cat "$backup_dir/brew_cask_list.txt")

# remove outdated formulae
brew cleanup
