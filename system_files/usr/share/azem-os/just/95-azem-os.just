export pipx_spec_file := env("AZEMOS_PIPX_SPEC_FILE", prepend(env('HOME'), "/.pipx.spec.json"))
export flatpak_spec_file := env("AZEMOS_FLATPAK_SPEC_FILE", prepend(env('HOME'), "/.flatpak.spec.txt"))


# Install the latest version of the Node Version Manager (nvm)
[group('AzemOS')]
install-nvm:
    #!/usr/bin/env bash
    echo "Installing nvm..."

    export NVM_DIR="$HOME/.nvm"
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    \. "$NVM_DIR/nvm.sh"

    echo 'nvm installed. Configure as indicated on https://github.com/nvm-sh/nvm?tab=readme-ov-file#profile_snippet'

# Update to the latest version of the Node Version Manager (nvm)
[group('AzemOS')]
update-nvm:
    #!/usr/bin/env bash
    export NVM_DIR="$HOME/.nvm"

    cd "$NVM_DIR"
    git fetch --tags origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    \. "$NVM_DIR/nvm.sh"

# Install the XIV Launcher, configured to use the KDE Wallet
[group('AzemOS')]
install-xivlauncher:
    #!/usr/bin/env bash

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

# Save the user's install pipx programs to a spec for easy reference
[group('AzemOS')]
save-pipx-spec:
    #!/usr/bin/env bash
    pipx list --json > ${pipx_spec_file}

# Update the user's install pipx programs and spec file
[group('AzemOS')]
update-pipx:
    #!/usr/bin/env bash
    pipx upgrade-all
    pipx list --json > ${pipx_spec_file}

# Save the user's install flatpaks to a spec for easy reference
[group('AzemOS')]
save-flatpak-spec:
    #!/usr/bin/env bash
    flatpak list --user --app --columns=application > ${flatpak_spec_file}

# Install user's flatpaks from a spec
[group('AzemOS')]
install-user-flatpaks:
    #!/usr/bin/env bash
    xargs -a ${flatpak_spec_file} flatpak --user -y install

# Install the 1password cli
[group('AzemOS')]
install-1password-cli:
    #!/usr/bin/env bash
   rpm-ostree install 1password-cli
