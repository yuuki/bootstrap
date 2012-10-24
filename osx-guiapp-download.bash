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
echo "Yorufukuro"
wget_unzip YoruFukuro.zip http://aki-null.net/yf/YoruFukurou_SL.zip
echo "Kobito"
wget_unzip Kobito.zip http://kobitoapp.com/download/Kobito_v1.1.zip
echo "MacTeX"
wget_unzip MacTex.mpkg http://mirror.ctan.org/systems/mac/mactex/MacTeX.mpkg.zip

# dmg
echo "Dropbox"
wgetq Dropbox.dmg https://www.dropbox.com/downloading?os=mac
echo "Github"
wgetq Github.dmg https://central.github.com/mac/latest
echo "UpTex"
wgetq UTeX20111010.dmg http://www2.kumagaku.ac.jp/teacher/herogw/archive/UTeX20111010.dmg
echo "TotalTerminal"
wgetq TotalTerminal.dmg http://downloads.binaryage.com/TotalTerminal-1.3.dmg
echo "Spark"
wgetq Spark.dmg http://www.macupdate.com/download/14352/Spark.dmg
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
echo "Growl http://click.linksynergy.com/fs-bin/stat?id=p2jXy8FHIGg&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fgrowl%252Fid467939042%253Fmt%253D12%2526uo%253D4%2526partnerId%253D30"
echo "Mermory Scope https://itunes.apple.com/jp/app/memory-scope/id470372671?mt=12"
echo "GeekTool https://itunes.apple.com/jp/app/geektool/id456877552?mt=12"
echo "Chrome http://www.google.com/chrome/eula.html?hl=ja"
echo "OSX Command Line Tools https://developer.apple.com/downloads/index.action#"

