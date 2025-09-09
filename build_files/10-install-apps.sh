#!/bin/bash

set -ouex pipefail
mkdir -p /var/opt

dnf5 -y copr enable ublue-os/packages

set -ouex pipefail

# build list of all packages requested for inclusion
readarray -t INCLUDED_PACKAGES < <(jq -r "[(.all.include | (select(.all != null).all)[])] \
                    | sort | unique[]" /ctx/packages.json)

# Install Packages
if [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 ]]; then
	dnf5 -y install "${INCLUDED_PACKAGES[@]}"
else
	echo "No packages to install."
fi
