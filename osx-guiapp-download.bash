#! /bin/bash

# Installer my favorite Mac Applications for OSX 10.8

echo "Download and install Mac Applications ..."

APPDIR=$HOME/Downloads/App
[[ -f $APPDIR ]]; || mkdir -p $APPDIR
WGET="wget -N -P -q0- $APPDIR "

# OSX Command line tools
$WGET -O cli-tools-xcode-mountaion-lion.dmg https://developer.apple.com/downloads/index.action#
# Shades
$WGET -O shades-intel.zip http://www.charcoaldesign.co.uk/shades/download/intel
# Dropbox
$WGET -O Dropbox.dmg https://www.dropbox.com/downloading?os=mac
# Github
$WGET -O Github.dmg https://central.github.com/mac/latest

$WGET \
http://pages.uoregon.edu/koch/texshop/texshop-64/texshop.zip             # TexShop    \
http://mirror.ctan.org/systems/mac/mactex/MacTeX.mpkg.zip                # MacTex     \
http://www2.kumagaku.ac.jp/teacher/herogw/archive/UTeX20111010.dmg       # UpTex      \
http://www.macupdate.com/download/30591/RightZoom.zip                    # RightZoom  \
http://aki-null.net/yf/YoruFukurou_SL.zip                                # Yorufukuro \
http://www.google.com/chrome/eula.html?hl=ja                             # Chrome     \
http://cloud.github.com/downloads/psychs/limechat/LimeChat_2.33a.tbz     # LimeChat   \
http://downloads.binaryage.com/TotalTerminal-1.3.dmg                     # TotalTerminal \
http://www.macupdate.com/download/14352/Spark.dmg                        # Spark      \
http://kobitoapp.com/download/Kobito_v1.1.zip                            # Kobito     \
http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg            # Sequel Pro \
http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.8.0.dmg # KeyRemap4MacBook

echo "PCKeyboardHack"
$WGET -O $APPDIR/PCKeyboardHack.dmg http://pqrs.org/macosx/keyremap4macbook/files/PCKeyboardHack-8.0.0.dmg
hdiutil mount $APPDIR/PCKeyboardHack.dmg
# open -a /Volumes/PCKeyboardHack/ $APPDIR/PCKeyboardHack.prefPane

echo "GrowlNotify"
$WGET -O $APPDIR/growlnotify.zip http://growl.cachefly.net/GrowlNotify-2.0.zip && unzip growlnotify.zip && rm $APPDIR/growlnotify.zip
sudo installer -pkg $APPDIR/GrowlNotify.pkg -target /Volumes/MAIN/

echo "Done install GUI App"


echo "Additionally, more necessory app are here."
echo "Growl http://click.linksynergy.com/fs-bin/stat?id=p2jXy8FHIGg&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fgrowl%252Fid467939042%253Fmt%253D12%2526uo%253D4%2526partnerId%253D30"
echo "Mermory Scope https://itunes.apple.com/jp/app/memory-scope/id470372671?mt=12"
echo "GeekTool https://itunes.apple.com/jp/app/geektool/id456877552?mt=12"

