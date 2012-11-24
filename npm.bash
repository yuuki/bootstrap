#!/bin/bash

echo "Setup npm"

if ! type node > /dev/null 2>&1; then
    echo "Install nodejs ..."
    brew install nodejs
    hash -r
fi

# if ! type npm > /dev/null 2>&1; then
#     echo "Install npm ..."
#     curl https://npmjs.org/install.sh | sh
# fi

echo "Update npm ..."
npm -g update

echo "Install coffee-script ..."
npm -g install coffee-script

echo "Install jshint ..."
npm -g install jshint

echo "Install node.dev ..."
npm -g install node-dev

echo "Install less ..."
npm -g install less
