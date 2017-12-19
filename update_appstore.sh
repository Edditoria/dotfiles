#!/usr/bin/env bash

# update apps from Mac AppStore
sudo softwareupdate -l -v
read -p "update apps from Mac AppStore now? [Y|n] " input_macapp
if [[ $input_macapp =~ ^(Y|y|Yes|yes) ]]; then
	sudo softwareupdate -i -a -v
else
	echo "Skipped update from Mac App Store"
fi
