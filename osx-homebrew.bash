#!/bin/bash

echo "Homebrew setting"

gem install brewdler

if [[ -x $(/usr/bin/which -s gcc) ]]; then
    echo "Not Found MacOS X Command Line Tools"
    exit 1
fi

if [[ -x $(/usr/bin/which -s brew) ]]; then
    echo "Install Homebrew ..."
    sudo mkdir /usr/local
    sudo chmod 755 /usr/local
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

gem install brewdler

BREW="/usr/local/bin/brew"

$BREW update
brewdle install
$BREW linkapps

echo "Done Homebrew Setup"
