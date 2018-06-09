#!/usr/bin/env bash

# These scripts will install rbenv
# And then ruby version that fit to rails
# And then try to install rails gem
# !important: Need to update version manually, info: http://guides.rubyonrails.org

mkdir -p "$(rbenv root)/plugins"
rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1
rbenv rehash
echo "[\$_\$] rbenv versions"
rbenv versions
gem install bundler
rbenv rehash

# skip: Set default bundle path
# because it is done in install_home_dotfiles.sh
# mkdir -p ~/.bundle
# printf -- "----\nBUNDLE_PATH: vendor/bundle" >> ~/.bundle/config

echo "[\$_\$] rbenv which gem"
rbenv which gem # /Users/Edditoria/.rbenv/versions/2.3.3/bin/gem
echo "[\$_\$] rbenv which bundle"
rbenv which bundle # /Users/Edditoria/.rbenv/versions/2.3.3/bin/bundle

rbenv rehash
# gem install rails -v 5.0.1
# rbenv rehash
# echo "[\$_\$] rails -v"
# rails -v
