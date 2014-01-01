#!/bin/bash


PATH="$HOME/.plenv/bin:$PATH"
# export CONFIGURE_OPTS="--enable-shared --with-openssl-dir=/usr/local --with-readline-dir=/usr/local"
current_perl_version="5.18.1"

echo "Setup plenv"
eval "$(plenv init -)"
exec $SHELL -l

echo "Install $current_perl_version"
plenv install $current_perl_version

echo "Switch to $current_perl_version"
plenv global $current_perl_version

echo "Install CPAN modules ..."
cpanm --notest       \
    Carton           \
    Project::Libs    \
    Module::Install  \
    Module::Install::AuthorTests \
    Test::Pretty     \
    App::pmuninstall \
    Carp::REPL       \
    Devel::REPL      \
    App::Ack         \
    Devel::KYTProf


current_perl_version="5.14.4"

echo "Setup plenv"
eval "$(plenv init -)"

echo "Install $current_perl_version"
plenv install $current_perl_version

echo "Switch to $current_perl_version"
plenv global $current_perl_version

echo "Install CPAN modules ..."
cpanm --notest       \
    Carton           \
    Project::Libs    \
    Module::Install  \
    Module::Install::AuthorTests \
    Test::Pretty     \
    App::pmuninstall \
    Carp::REPL       \
    Devel::REPL      \
    App::Ack         \
    Devel::KYTProf
