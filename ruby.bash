#!/bin/bash

if [[ ! "$(type rbenv > /dev/null 2>&1)" ]]; then
    echo "Install rbenv ..."
    git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
fi

export CONFIGURE_OPTS="--enable-shared --with-openssl-dir=/usr/local --with-readline-dir=/usr/local"
current_ruby_version="1.9.3-p286"

echo "Setup rbenv"
eval "$(rbenv init -)"

echo "Install $current_ruby_version"
rbenv install $current_ruby_version

echo "Switch to $current_ruby_version"
rbenv global $current_ruby_version

gem update --system
gem update
gem install bundler pry pry-doc pry-coolline powder reek roodi flog flay tmuxinator
rbenv rehash
