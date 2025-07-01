#!/usr/bin/env bash

function update_ruby_gems {
	gem update --system
	if command -v bundle > /dev/null; then
		gem update bunder
	else
		gem install bundler
	fi
	gem cleanup
}
