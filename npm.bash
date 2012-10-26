#!/bin/bash

echo "Setup npm"

if [[ -x "(/usr/bin/which -s node)" ]]; then
    echo "Install nodejs ..."
    brew install nodejs
fi

if [[ -x "$(/usr/bin/which -s npm)" ]]; then
    echo "Install npm ..."
    curl https://npmjs.org/install.sh | sh
fi

echo "Update npm ..."
npm -g update

echo "Install coffee-script ..."
npm -g install coffee-script

echo "Install jshint ..."
npm -g install jshint
