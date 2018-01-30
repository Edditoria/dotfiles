#!/usr/bin/env bash

apm_list_file="$DOTFILES/data/apm_list.txt"

source $DOTFILES/utils/run_by_line.sh
run_by_line "apm install" $apm_list_file
