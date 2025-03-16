#!/bin/bash
RESTART_INSTRUCTIONS="Dropping to shell. To rebuild, swipe from the top of your screen, touch the arrow on the right side of your Termux Notification, touch 'Exit', then relaunch this app."
if ! ls /storage/emulated/0 >/dev/null 2>&1
then
    yes | pkg install termux-am
    yes | termux-setup-storage
fi
cat <<EOF
echo 'Autodetecting baserom.us.z64. This can take a long time.'
if [ -f ~/baserom.us.z64 ]
then
    BASEROM_PATH=~/baserom.us.z64
else
    cp "${BASEROM_PATH}" ~/baserom.us.z64
apt-mark hold bash
yes | pkg upgrade -y
yes | pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which
cd
if [ -d "sm64coopdx" ]
then
    cp "${BASEROM_PATH}" sm64coopdx/baserom.us.z64
    cd sm64coopdx
    git reset --hard HEAD
    git pull origin android
    git submodule update --init --recursive
    make distclean
else
    git clone --recursive https://github.com/ManIsCat2/sm64coopdx.git
    cp "${BASEROM_PATH}" sm64coopdx/baserom.us.z64
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
