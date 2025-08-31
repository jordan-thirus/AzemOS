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

dnf5 config-manager addrepo --id="vscodium" \
	--set=baseurl="https://download.vscodium.com/rpms" \
	--set=gpgkey="https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" \
	--set=enabled=0

dnf5 -y copr enable ublue-os/packages

dnf5 install -y \
	--enable-repo="1password" \
	--enable-repo="mullvad-stable" \
	--enable-repo="vscodium" \
	1password \
	1password-cli \
	bcc \
	bpftrace \
	codium \
	nicstat \
	numactl \
	mullvad-vpn \
	pipx \
	podlet \
	podman-compose \
	sysprof \
	sysstat \
	tiptop \
	trace-cmd \
	virt-manager \
	virt-v2v \
	virt-viewer \
	ublue-os-libvirt-workarounds

systemctl enable mullvad-daemon.service
systemctl enable ublue-os-libvirt-workarounds.service

install -Dm0644 -t /etc/ublue-os/ /ctx/flatpaks/*.list
