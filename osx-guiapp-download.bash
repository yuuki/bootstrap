#! /bin/bash

# Installer my favorite Mac Applications for OSX 10.8

APPDIR=$HOME/Downloads/App

echo "Download and install Mac Applications ..."

[[ -f $APPDIR ]] || mkdir -p $APPDIR

function wgetq {
    wget -O "$APPDIR/$1" $2
}

function wget_unzip {
    zip=$1
    url=$2
    wgetq $zip $url
    unzip -d $APPDIR $APPDIR/$zip
    rm $APPDIR/$zip
}

# zip
echo "GrowlNotify"
wget_unzip growlnotify.zip http://growl.cachefly.net/GrowlNotify-2.0.zip
sudo installer -pkg $APPDIR/GrowlNotify.pkg -target /Volumes/MAIN/
echo "Shades"
wget_unzip shades-intel.zip http://www.charcoaldesign.co.uk/shades/download/intel
echo "TexShop"
wget_unzip texshop.zip http://pages.uoregon.edu/koch/texshop/texshop-64/texshop.zip
echo "RightZoom"
wget_unzip RightZoop.zip http://www.macupdate.com/download/30591/RightZoom.zip
echo "Kobito"
wget_unzip Kobito.zip http://kobitoapp.com/download/Kobito_v1.1.zip
echo "MacTeX"
wget_unzip MacTex.mpkg http://mirror.ctan.org/systems/mac/mactex/MacTeX.mpkg.zip
wget_unzip iTerm2.zip http://iterm2.googlecode.com/files/iTerm2-1_0_0_20120726.zip

# dmg
echo "Github"
wgetq Github.dmg https://central.github.com/mac/latest
echo "UpTex"
wgetq UTeX20111010.dmg http://www2.kumagaku.ac.jp/teacher/herogw/archive/UTeX20111010.dmg
echo "TotalTerminal"
wgetq TotalTerminal.dmg http://downloads.binaryage.com/TotalTerminal-1.3.dmg
echo "Spark"
wgetq Spark.dmg http://www.shadowlab.org/softwares/Spark/Spark.dmg
echo "SequelPro"
wgetq SequelPro.dmg http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg
echo "KeyRemap4MacBook"
wgetq KeyRemap4MacBook.dmg http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.8.0.dmg
echo "PCKeyboardHack"
wgetq PCKeyboardHack.dmg http://pqrs.org/macosx/keyremap4macbook/files/PCKeyboardHack-8.0.0.dmg
hdiutil mount $APPDIR/PCKeyboardHack.dmg
# open -a /Volumes/PCKeyboardHack/ $APPDIR/PCKeyboardHack.prefPane


echo "LimeChat"
wgetq -O LimeChat.tbz http://cloud.github.com/downloads/psychs/limechat/LimeChat_2.33a.tbz

echo "Done install GUI App"


echo "Additionally, more necessory app are here."
echo "Growl"
echo "Mermory Scope"
echo "GeekTool"
echo "Chrome"
echo "Dropbox"
echo "OSX Command Line Tools https://developer.apple.com/downloads/index.action#"

