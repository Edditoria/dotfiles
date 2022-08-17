#!/usr/bin/env bash

# This file contains scripts to symlink Music directories from Dropbox
# Require: 1. Dropbox installed 2. completely sync Music directories

function symlink_music {
	local music_dir="$HOME/Dropbox/Music"
	ln -s "$music_dir/album covers" "$HOME/Music"
	ln -s "$music_dir/GarageBand" "$HOME/Music"
	ln -s "$music_dir/iPod" "$HOME/Music"
	ln -s "$music_dir/iTunes" "$HOME/Music"
	ln -s "$music_dir/MixVibes" "$HOME/Music"
	ln -s "$music_dir/Music" "$HOME/Music"
}
symlink_music
