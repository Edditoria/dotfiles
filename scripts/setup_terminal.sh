#!/usr/bin/env bash

if [[ "$(uname -s)" == 'Darwin' ]]; then
	echo '[setup:terminal] Start...'
	source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && cd ..  && pwd)/functions/setup_macos_terminal.sh"
	setup_macos_terminal 'Novel_customized' false
	setup_macos_terminal 'WWDC16_Dark_Customized' true
	echo '[setup:terminal] Finishing...'
	sleep 1
	killall Terminal
else
	echo '[setup:terminal] Currently only support macOS :('
	return 1 2> /dev/null || exit 1
fi
