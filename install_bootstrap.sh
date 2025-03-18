#!/data/data/com.termux/files/usr/bin/sh
# Automatically install Termux bootstrap if not installed

if [ ! -f "$PREFIX/bin/sh" ]; then
    echo "Installing Termux bootstrap..."
    ARCH=$(dpkg --print-architecture)
    BOOTSTRAP_URL="https://github.com/termux/termux-packages/releases/download/bootstrap-2025.03.16-r1%2Bapt-android-7/bootstrap-${ARCH}.zip"
    
    # Download the bootstrap
    wget "$BOOTSTRAP_URL" -O bootstrap.zip

    # Extract bootstrap
    unzip bootstrap.zip -d $PREFIX
    chmod -R 700 $PREFIX

    echo "Bootstrap installation complete. Restarting Termux..."
    exit
fi

echo "Bootstrap is already installed."