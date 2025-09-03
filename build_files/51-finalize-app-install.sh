#!/usr/bin/bash
set -euo pipefail

log() {
	echo "=== $* ==="
}

log Enabling system services

systemctl enable mullvad-daemon.service
systemctl enable ublue-os-libvirt-workarounds.service

log Running 1Password $(after-install) script

# create a symlink and run 1Password post install script. It requires the /opt/1Password directory to exist
ln -s /usr/lib/opt/1Password /opt/1Password
sh /usr/lib/opt/1Password/after-install.sh
rm /opt/1Password

install -Dm0644 -t /etc/ublue-os/ /ctx/flatpaks/*.list
