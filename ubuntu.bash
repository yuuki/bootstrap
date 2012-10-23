#! /bin/bash

echo "update"
sudo apt-get update

echo "upgrade"
sudo apt-get upgrade

sudo apt-get install git zsh vim byobu openssh-server openssh-client ncurses libncurses5 libncurses5-dev cgdb ctags curl

echo "Done"
