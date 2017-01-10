#!/usr/bin/env bash

# These scripts will install npm via nvm for you.
# node versions include:
# 1. latest stable
# 2. latest argon
# 3. latest boron
# Then, nvm alias: "argon" to latest argon, and "boron" to latest boron
# Then, npm alias default boron
# !important: alias will be used for update_brew.sh in future

nvm install stable
nvm install lts/argon
nvm alias argon $(nvm version lts/argon) # for better control, and type faster
nvm install lts/boron
nvm alias boron $(nvm version lts/boron) # for better control, and type faster
nvm alias default boron
nvm use boron
