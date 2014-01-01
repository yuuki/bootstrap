#!/bin/bash

PATH="$HOME/.rbenv/bin:$PATH"
# export CONFIGURE_OPTS="--enable-shared --with-openssl-dir=/usr/local --with-readline-dir=/usr/local"
current_ruby_version="2.0.0-p353"

echo "Setup rbenv"
eval "$(rbenv init -)"

echo "Install $current_ruby_version"
rbenv install $current_ruby_version

echo "Switch to $current_ruby_version"
rbenv global $current_ruby_version

gem update --system
gem update
gem install --no-ri --no-rdoc  bundler pry pry-doc pry-coolline powder reek roodi flog flay tmuxinator hub brewdler rbenv-rehash rbenv-bundler
rbenv rehash
