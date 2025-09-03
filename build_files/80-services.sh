#!/usr/bin/bash
set -euo pipefail


systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service
systemctl enable mullvad-daemon.service
systemctl enable ublue-os-libvirt-workarounds.service