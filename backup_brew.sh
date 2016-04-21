#!/usr/bin/env bash

# this should be exeute in dotfiles folder

echo $( brew leaves ) > brew_leaves.txt
echo $( brew cask list) > brew_cask_list.txt
