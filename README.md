# Azem OS

A personalize image based off of [Bazzite](https://bazzite.gg/) for gaming and software development. To share settings across systems, I recommend setting up a [dotfiles repo](https://sarab.dev/posts/dotfiles-bare-git-repo/).

## Additional Features
The following are installed in addition to what is included in Bazzite.

### Programs
- 1Password
- Mullvad VPN 
- VSCodium 
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
```
    install-1password-cli    # Install the 1password cli
    install-azemos           # For a fresh install. Install all flatpaks, pipx programs, brews, and nvm
    install-azemos-flatpaks  # Install system flatpaks for AzemOS
    install-brew-bundle      # Install brews from the global Brewfile
    install-nvm              # Install the latest version of the Node Version Manager (nvm)
    install-pipx-programs    # Update the user's install pipx programs and spec file
    install-xivlauncher      # Install the XIV Launcher, configured to use the KDE Wallet
    save-pipx-spec           # Save the user's install pipx programs to a spec for easy reference
    start-quadlet-containers # Start or restart all quadlet containers for a user
    update-nvm               # Update to the latest version of the Node Version Manager (nvm)
    update-pipx              # Update the user's install pipx programs and spec file
```
### TODO
- [ ] build NVIDIA variant
- [ ] setup changelog

## Using Azem OS

First, install Bazzite using the [image picker](https://bazzite.gg/#image-picker) to get the desired image. Choose `Desktop`, `AMD` GPU, `KDE` desktop environment, `No` Steam gaming mode.

After installation, run the following command to switch to the AzemOS image
```bash
sudo bootc switch ghcr.io/jordan-thirus/azemos:latest
```
This will queue for the next reboot, which you can do immediately after the command finishes. Future updates can be installed with the `ujust update` command.
