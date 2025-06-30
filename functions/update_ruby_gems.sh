#!/usr/bin/env bash

function update_ruby_gems {
	gem update --system
	gem update bundler
	gem cleanup
}
