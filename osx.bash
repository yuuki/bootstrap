#! /bin/bash

echo "OSX system setting"

# Don't make .DS_Store over network
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# enable antialias
defaults -currentHost write -g AppleFontSmoothing -int 3

# Disable warning when changing extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
# Display hidden files
defaults write com.apple.finder AppleShowAllFiles true
# Display always extention
defaults write -g AppleShowAllExtensions -bool true

# Hide automatically Dock
defaults write com.apple.dock autohide -bool true
# Display Dock with no-delay
defaults write com.apple.dock autohide-delay -float 0
# Display ighlightly stack
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Enable tap click mode
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable drag lock
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true

# Disable warning launch application from the Internet
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic spelling correction
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable asking ask for password
defaults write com.apple.screensaver askForPassword -int 1
# Enable asking ask no-delay
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable unnecessory deamons
defaults write com.reederapp.mac ServiceAlternateBrowserDisabled -bool true
defaults write com.reederapp.mac ServiceBlogDisabled -bool true
defaults write com.reederapp.mac ServiceDeliciousDisabled -bool true
defaults write com.reederapp.mac ServiceEvernoteDisabled -bool true
defaults write com.reederapp.mac ServiceGoogleMobilizerDisabled -bool true
defaults write com.reederapp.mac ServiceInstapaperDisabled -bool true
defaults write com.reederapp.mac ServiceInstapaperMobilizerDisabled -bool true
defaults write com.reederapp.mac ServiceMailLinkDisabled -bool true
defaults write com.reederapp.mac ServicePinboardDisabled -bool true
defaults write com.reederapp.mac ServiceReadabilityDisabled -bool true
defaults write com.reederapp.mac ServiceZootoolDisabled -bool true

# Enable locate command
launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

killall Finder >> /dev/null
killall Dock >> /dev/null
killall SystemUIServer >> /dev/null

echo "Done OSX system setting"

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

/usr/local/bin/brew install wget git zsh openssl readline tig tmux rbenv rbenv-gemset ruby-build curl coreutils boost git-flow gnu-sed shared-mime-info sqlite byobu calc ctags keychain nkf mercurial

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
