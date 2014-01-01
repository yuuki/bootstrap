#!/bin/bash

echo "Homebrew setting"

if [[ -x $(/usr/bin/which -s gcc) ]]; then
    echo "Not Found MacOS X Command Line Tools"
    exit 1
fi

if [[ -x $(/usr/bin/which -s brew) ]]; then
    echo "Install Homebrew ..."
    sudo mkdir /usr/local
    sudo chmod 755 /usr/local
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

BREW="/usr/local/bin/brew"

$BREW update
brewdle install
$BREW linkapps

echo "Done Homebrew Setup"
