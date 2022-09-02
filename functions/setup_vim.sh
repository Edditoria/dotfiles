#!/usr/bin/env bash

function setup_vim {
	mkdir -p "$HOME/.vim/autoload"
	mkdir -p "$HOME/.vim/backup"
	mkdir -p "$HOME/.vim/colors"
	mkdir -p "$HOME/.vim/plugged"
	curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo 'NOTE: You need to manually run `:PlugInstall` in Vim.'
}
