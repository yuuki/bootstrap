#!/bin/bash

# function notify() {
#     if [[ -x "$(/usr/bin/which -s growlnotify)" ]]; then
#         growlnotify -m "$1"
#     fi
#
#     echo "$1"
# }

if [[ ! "$(type perlbrew > /dev/null 2>&1)" ]]; then
    echo "Install perlbrew ..."
    curl -kL http://install.perlbrew.pl | bash
    source $HOME/.perlbrew/etc/bashrc
fi

export PERLBREW_ROOT=$HOME/.perlbrew
__PERL_VERSION='perl-5.14.3'

echo "Install $__PERL_VERSION ..."
perlbrew install $__PERL_VERSION

echo "Install cpanm ..."
perlbrew install-cpanm


echo "Switch to $__PERL_VERSION"
perlbrew switch $__PERL_VERSION

echo "Install CPAN modules ..."
cpanm --notest       \
    Project::Libs    \
    Module::Install  \
    Vi::QuickFix     \
    Test::Pretty     \
    App::pmuninstall \
    Carp::REPL       \
    Devel::REPL
