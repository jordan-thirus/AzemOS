# Azem OS

A personalize image based off of [Bazzite](https://bazzite.gg/) for gaming and software development. To share settings across systems, I recommend setting up a [dotfiles repo](https://sarab.dev/posts/dotfiles-bare-git-repo/).

## Additional Features
The following are installed in addition to what is included in Bazzite.

### Programs
- 1Password
- Mullvad VPN 
- VSCodium 
- pipx
- podlet
- podman-compose

### Flatpaks
- Calibre
- Discord
- Syncthing (using Syncthingy)
- Obsidian.md
- LibreOffice
- Zoom
- Podman Desktop

### `ujust` commands
- `install-nvm` \ `update-nvm` - performs a manual or update install of NVM. Your dotfile of choice needs to be updated.
- `install-xivlauncher` - installs the XIVLauncher as a Steam compatability tool with the default credentials storage as the KDEWallet. This provides a better experience running FFXIV on Linux.
- `save-pipx-spec` - Saves the user's installed pipx programs to a file for replicating across multiple installs. Default location is `~/.pipx.spec.json`
- `update-pipx` - Upgrades all pipx programs then updates the pipx spec file.
- `save-flatpak-spec` - Saves the user's flatpaks programs to a file for replicating across multiple installs. Default location is `~/.flatpak.spec.txt`
- `install-user-flatpaks` - Installs user-scoped flatpaks from the spec file
- `install-azemos-flatpaks`  - Installs system-scoped flatpaks for AzemOS. Necessary after rebasing.
- `install-1password-cli` - Install the 1Password CLI by layering it via `rpm-ostree`

### TODO
- [ ] build NVIDIA variant
- [ ] add command to install SMAPI 
- [ ] setup changelog

## Using Azem OS

First, install Bazzite using the [image picker](https://bazzite.gg/#image-picker) to get the desired image. Choose `Desktop`, `AMD` GPU, `KDE` desktop environment, `No` Steam gaming mode.

After installation, run the following command to switch to the AzemOS image
```bash
sudo bootc switch ghcr.io/jordan-thirus/azemos:latest
```
This will queue for the next reboot, which you can do immediately after the command finishes. Future updates can be installed with the `ujust update` command.
