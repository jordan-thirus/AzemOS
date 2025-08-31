# vim: set ft=make :

# Install the latest version of the Node Version Manager (nvm)
install-nvm:
    #!/usr/bin/bash
    echo "Installing nvm..."

    export NVM_DIR="$HOME/.nvm"
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    \. "$NVM_DIR/nvm.sh"

    echo 'nvm installed. Configure as indicated on https://github.com/nvm-sh/nvm?tab=readme-ov-file#profile_snippet'

# Install the XIV Launcher, configured to use the KDE Wallet
install-xivlauncher:
    #!/bin/sh -e

    echo "-- XLM Native Auto-Installer --"
    echo

    if [ "$(id -u)" -eq 0 ]; then
        echo 'This script cannot be ran as the root user or with sudo. Please run it as a regular user.'
        exit 1
    fi

    echo "[Step: 1] Downloading XLM"
    curl --fail -L https://github.com/Blooym/xlm/releases/latest/download/xlm-x86_64-unknown-linux-gnu > /tmp/xlm

    echo "[Step: 2] Configuring XLM as a Steam Tool"
    chmod +x /tmp/xlm
    /tmp/xlm install-steam-tool --xlm-updater-disable --extra-launch-args="--run-as-steam-compat-tool=true" --steam-compat-path ~/.steam/root/compatibilitytools.d/

    echo "[Step: 3] Cleanup XLM binary"
    rm /tmp/xlm

    echo
    echo "-- Auto Installer Complete: Restart Steam and follow the guide at https://goatcorp.github.io/faq/steamdeck or https://github.com/Blooym/xlm#readme to continue! --"

# # Install a specific version of SMAPI
# install-smapi VERSION:
#      #!/bin/sh -e
#     echo "Installing SMAPI..."
#      curl --fail -L https://github.com/Pathoschild/SMAPI/releases/download/{{VERSION}}/SMAPI-{{VERSION}}-installer.zip > /tmp/SMAPI.zip
#     GAME_DIRECTORY='~/.steam/steam/steamapps/common/Stardew Valley/'
