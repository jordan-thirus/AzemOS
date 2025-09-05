#!/usr/bin/bash
set -euo pipefail

trap '[[ $BASH_COMMAND != echo* ]] && [[ $BASH_COMMAND != log* ]] && echo "+ $BASH_COMMAND"' DEBUG

log() {
	echo "=== $* ==="
}

log "Starting system cleanup"

# Clean package manager cache
dnf5 clean all
dnf5 -y copr disable ublue-os/packages
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_ublue-os-akmods.repo
# sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/1password.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/mullvad.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/vscodium.repo

# Clean temporary files
rm -rf /tmp/*
# Cleanup the entirety of `/var`.
# None of these get in the end-user system and bootc lints get super mad if anything is in there
rm -rf /var
mkdir -p /var

# Commit and lint container
bootc container lint || true

log "Cleanup completed"
