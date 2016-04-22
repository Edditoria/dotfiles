#!/usr/bin/env bash

HLINE="-------"

# get current dir
DOTFILES_DIR="$( CD "$( dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$DOTFILES_DIR/backup"

# this should be exeute in dotfiles folder

echo $( brew leaves ) > "$BACKUP_DIR/brew_leaves.txt"
echo "# Test: read Brew Leaves txt file"
echo $HLINE
cat "$BACKUP_DIR/brew_leaves.txt"
echo " "

echo $( brew cask list) > "$BACKUP_DIR/brew_cask_list.txt"
echo "# Test: read Cask apps txt file"
echo $HLINE
cat "$BACKUP_DIR/brew_cask_list.txt"
echo " "

echo $( ls /Applications ) > "$BACKUP_DIR/app_list.txt"
echo "# Test: read all apps list txt file"
echo $HLINE
cat "$BACKUP_DIR/app_list.txt"
echo " "
