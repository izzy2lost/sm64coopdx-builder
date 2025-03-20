#!/data/data/com.termux/files/usr/bin/bash

# Silent bootstrap installation
BOOTSTRAP_LOCK="$PREFIX/../.bootstrap_installed"
BOOTSTRAP_URL='https://github.com/termux/termux-packages/releases/download/bootstrap-2025.03.16-r1%2Bapt-android-7/bootstrap-aarch64.zip'

install() {
    echo "Starting bootstrap installation..."
    
    # Install required tools
    apt update -yq && apt install -yq curl unzip
    
    # Download and extract
    TMP=$(mktemp -d)
    curl -sL "$BOOTSTRAP_URL" -o "$TMP/bootstrap.zip"
    unzip -q "$TMP/bootstrap.zip" -d "$TMP"
    
    # Copy files
    cp -r "$TMP/bootstrap-aarch64/." "$PREFIX/../"
    
    # Cleanup
    rm -rf "$TMP"
    touch "$BOOTSTRAP_LOCK"
    echo "Bootstrap installed successfully"
}

# Only install if not already installed
[ ! -f "$BOOTSTRAP_LOCK" ] && install