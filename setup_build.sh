#!/data/data/com.termux/files/usr/bin/bash

# Update Termux and install dependencies
pkg update -y && pkg upgrade -y
pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which -y

# Clone the repository
git clone --recursive https://github.com/ManIsCat2/sm64coopdx.git $HOME/sm64coopdx

# Move baserom into the project directory
mv $HOME/baserom.us.z64 $HOME/sm64coopdx/

# Build the project
cd $HOME/sm64coopdx
make