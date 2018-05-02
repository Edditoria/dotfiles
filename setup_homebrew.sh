#!/usr/bin/env bash

# These scripts will install brew formulae and Cask apps

# get current dir
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export HOMEBREW_CASK_OPTS="--appdir=/Applications/Cask"
source $dotfiles_dir/utils/run_by_line.sh

# update Homebrew and formulae
brew -v update
brew upgrade # --all is default in latest brew

# install brew formulae
run_by_line "brew install" $dotfiles_dir/brew_leaves.txt

# add Cask repo to Homebrew
brew tap caskroom/cask
brew tap caskroom/fonts

# install cask apps
run_by_line "brew install" $dotfiles_dir/brew_cask_list.essential.txt
run_by_line "brew install" $dotfiles_dir/brew_cask_list.others.txt
