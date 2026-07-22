# Azem OS

A personalize image (that is increasingly slim) based off of [Bazzite](https://bazzite.gg/) for gaming and software development. To share settings across systems, I recommend setting up a [dotfiles repo](https://sarab.dev/posts/dotfiles-bare-git-repo/).

## Using Azem OS

First, install Bazzite using the [image picker](https://bazzite.gg/#image-picker) to get the desired image. Choose `Desktop`, `AMD` or `Nvida` GPU, `KDE` desktop environment, `No` Steam gaming mode.

After installation, run the following command to switch to the AzemOS image
```bash
sudo bootc switch ghcr.io/jordan-thirus/azemos:latest
```
This will queue for the next reboot, which you can do immediately after the command finishes. Future updates can be installed with the `ujust update` command.

## Migrate Back to Bazzite
This OS can be fully replicated at this point by installing the contents of the preinstalled [Brewfile](./system_files/usr/share/ublue-os/homebrew/preinstalled.d/Brewfile), copying or adding the contents of the [Justfile](system_files/usr/share/azem-os/just/95-azem-os.just) to your global Justfile of choice per the [documentation](https://just.systems/man/en/global-and-user-justfiles.html), and layering on [Mullvad](https://mullvad.net/en/help/install-mullvad-app-linux). The only purpose to using AzemOS as it is now is to avoid layering Mullvad.