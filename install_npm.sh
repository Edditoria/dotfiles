#!/usr/bin/env bash

nvm install stable
nvm install lts/argon
nvm alias argon $(nvm version lts/argon) # for better control, and faster
nvm install lts/boron
nvm alias boron $(nvm version lts/boron) # for better control, and faster
nvm alias default boron
nvm use boron
