#! /bin/bash

echo "update"
apt-get update

echo "upgrade"
apt-get upgrade

apt-get install git zsh vim byobu openssh-server openssh-client ncurses libncurses5 libncurses5-dev cgdb ctags curl

echo "Done"
