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

/usr/local/bin/brew update

echo "Homebrew package install ..."

/usr/local/bin/brew install \
    wget                \
    git                 \
    zsh                 \
    openssl             \
    readline            \
    tig                 \
    tmux                \
    rbenv               \
    rbenv-gemset        \
    ruby-build          \
    curl                \
    coreutils           \
    boost               \
    git-flow            \
    git-now             \
    gnu-sed             \
    gnu-tar             \
    gnu-time            \
    gnu-which           \
    shared-mime-info    \
    sqlite              \
    byobu               \
    calc                \
    ctags               \
    keychain            \
    nkf                 \
    mercurial           \
    autojump            \
    rename              \
    renameutils

/usr/local/bin/brew list | xargs brew link

echo "MacVim Kaoriya install ..."
/usr/local/bin/brew install --HEAD https://raw.github.com/splhack/homebrew-splhack/master/Library/Formula/cmigemo.rb
/usr/local/bin/brew install --HEAD https://raw.github.com/splhack/homebrew-splhack/master/Library/Formula/ctags-objc-ja.rb
brew link --overwrite cmigemo ctags-objc-ja.rb
/usr/local/bin/brew install --HEAD https://raw.github.com/splhack/homebrew-splhack/master/Library/Formula/macvim-kaoriya.rb
ln -s /usr/local/Cellar/macvim-kaoriya/HEAD/MacVim.app /Applications/
mkdir $HOME/bin
ln -s /usr/local/Cellar/macvim-kaoriya/HEAD/MacVim.app/Contents/MacOS/mvim $HOME/bin/mvim

/usr/local/bin/brew install mysql
#unset TMPDIR
#mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

echo "Done Homebrew package install"
