#!/usr/bin/bash
set -euo pipefail

systemctl --global enable ublue-user-setup.service
systemctl --global enable brew-preinstall.service
systemctl enable mullvad-daemon.service
