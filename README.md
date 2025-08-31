# Azem OS

A personalize image based off of [Bazzite](https://bazzite.gg/) for gaming and software development.

## Additional Features
The following are installed in addition to what is included in Bazzite.

### Programs
- 1Password + 1Password CLI
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
- `install-nvm` - performs a manual install of NVM. Your dotfile of choice needs to be updated.
- `install-xivlauncher` - installs the XIVLauncher as a Steam compatability tool with the default credentials storage as the KDEWallet. This provides a better experience running FFXIV on Linux.

### TODO
- [ ] build NVIDIA variant
- [ ] get 1Password autostart working
- [ ] update `update` to include updating NVM if neccesary and update pipx programs
- [ ] add command to install SMAPI 

## Using Azem OS

First, install Bazzite using the [image picker](https://bazzite.gg/#image-picker) to get the desired image. Choose `Desktop`, `AMD` GPU, `KDE` desktop environment, `No` Steam gaming mode.

After installation, run the following command to switch to the AzemOS image
```bash
sudo bootc switch ghcr.io/jordan-thirus/azemos:latest
```
This will queue for the next reboot, which you can do immediately after the command finishes.
