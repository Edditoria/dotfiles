#!/usr/bin/env bash

if [[ "$(uname -s)" == 'Darwin' ]]; then
	echo '[setup:terminal] Start...'
	source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)/../functions/setup_macos_terminal.sh"
	setup_macos_terminal 'Novel_customized' true
	echo '[setup:terminal] Finishing...'
	sleep 1
	killall Terminal
else
	echo '[setup:terminal] Currently only support macOS :('
	return 1 2> /dev/null || exit 1
fi
