#!/bin/bash

set -ouex pipefail
mkdir -p /var/opt

# Install Mullvad VPN
dnf5 config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
dnf5 config-manager setopt mullvad-stable.enabled=0
dnf5 config-manager addrepo --id="1password" \
	--set=baseurl="https://downloads.1password.com/linux/rpm/stable/x86_64" \
	--set=gpgkey="https://downloads.1password.com/linux/keys/1password.asc" \
	--set=enabled=0

dnf5 install -y --enable-repo="1password" --enable-repo="mullvad-stable" \
	pipx shellCheck shfmt podlet podman-compose 1password 1password-cli mullvad-vpn

systemctl enable mullvad-daemon.service

install -Dm0644 -t /etc/ublue-os/ /ctx/flatpaks/*.list
