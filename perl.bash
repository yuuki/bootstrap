#!/bin/bash

function notify() {
    if [[ -x "$(/usr/bin/which -s growlnotify)" ]]; then
        growlnotify -m "$1"
    fi

    echo "$1"
}

export PERLBREW_ROOT=$HOME/.perlbrew
__PERL_VERSION='perl-5.14.3'
notify "Install perlbrew"
curl -kL http://install.perlbrew.pl | bash
source $HOME/.perlbrew/etc/bashrc

notify "Install $__PERL_VERSION"
perlbrew install $__PERL_VERSION

notify "Install cpanm"
perlbrew install-cpanm


notify "Switch to $__PERL_VERSION"
perlbrew switch $__PERL_VERSION

notify "Install CPAN modules"
cpanm --notest       \
    Project::Libs    \
    Module::Install  \
    Vi::QuickFix     \
    Test::Pretty     \
    App::pmuninstall \
    Carp::REPL       \
    Devel::REPL
