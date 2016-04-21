#!/usr/bin/env bash

# this should be exeute in dotfiles folder

echo $( brew leaves ) > brew_leaves.txt
echo Here is the Brew Leaves
cat brew_leaves.txt

echo $( brew cask list) > brew_cask_list.txt
echo Here is the Cask apps list
cat brew_cask_list.txt

echo $( ls /Applications ) > app_list.txt
echo Here is all Apps list
cat app_list.txt
