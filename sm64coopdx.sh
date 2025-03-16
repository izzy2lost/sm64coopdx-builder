#!/bin/bash
RESTART_INSTRUCTIONS="Dropping to shell. To rebuild, swipe from the top of your screen, touch the arrow on the right side of your Termux Notification, touch 'Exit', then relaunch this app."
if ! ls /storage/emulated/0 >/dev/null 2>&1
then
    yes | pkg install termux-am
    cp /storage/emulated/0/baserom.us.z64 ~/baserom.us.z64
fi
pkg upgrade -y
pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which -y
    git clone --recursive https://github.com/ManIsCat2/sm64coopdx.git
    cp  /storage/emulated/0/baserom.us.z64 sm64coopdx/baserom.us.z64
    cd sm64coopdx
fi
make 2>&1 | tee build.log
if ! [ -f build/us_pc/sm64coopdx.apk ]
then
    cat <<EOF
____ ____ _ _    _  _ ____ ____
|___ |__| | |    |  | |__/ |___
|    |  | | |___ |__| |  \ |___
EOF
    echo $RESTART_INSTRUCTIONS
    exit 3
fi
cp build/us_pc/sm64coopdx.apk /storage/emulated/0
cat <<EOF
___  ____ _  _ ____
|  \ |  | |\ | |___
|__/ |__| | \| |___
EOF
echo 'Go to Files and touch sm64coopdx.apk to install!'
echo $RESTART_INSTRUCTIONS
