#!/usr/bin/env bash

# These scripts will install rbenv
# And then ruby version that fit to rails
# And then try to install rails gem
# !important: Need to update version manually, info: http://guides.rubyonrails.org

mkdir -p "$(rbenv root)/plugins"
rbenv install 2.3.3
rbenv rehash
rbenv global 2.3.3
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

# Install nokogirl gem in different way
# This may not fit to your case
# os_version="$(sw_vers -productVersion | sed 's:.[[:digit:]]*.$::g')"
# if [[ ${os_version} = "10.10" ]]; then
#   gem install nokogiri -- --use-system-libraries=true --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2/
# fi
# FUCK YOU RAILS. FUCK YOU NOKOGIRL.
# Anyway, the problem is solved by adding BUNDLE_BUILD__NOKOGIRI to .bundle/config

rbenv rehash
gem install rails -v 5.0.1
rbenv rehash
echo "[\$_\$] rails -v"
rails -v
