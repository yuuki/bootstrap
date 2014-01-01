#!/bin/bash

echo "Homebrew setting"

if [[ ! "$(type gcc > /dev/null 2>&1)" ]]; then
    echo "Not Found MacOS X Command Line Tools"
    exit 1
fi
if [[ ! "$(type brew > /dev/null 2>&1)" ]]; then
    echo "Install Homebrew ..."
    sudo mkdir /usr/local
    sudo chmod 755 /usr/local
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

sudo gem install brewdler

BREW="/usr/local/bin/brew"

$BREW update
brewdle install
$BREW linkapps

echo "Done Homebrew Setup"
