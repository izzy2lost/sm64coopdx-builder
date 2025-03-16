#!/data/data/com.termux/files/usr/bin/bash

# Update Termux and install dependencies
pkg update -y
pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which -y

# Clone the repository
git clone --recursive https://github.com/ManIsCat2/sm64coopdx.git

# Move baserom into the project directory
mv baserom.us.z64 sm64coopdx/baserom.us.z64

# Build the project
cd sm64coopdx
make