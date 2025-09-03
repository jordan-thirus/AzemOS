#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh
version-script azem-os-privileged-user-setup privileged 1 || exit 0

# Handle privileged tasks
bash /opt/1Password/install_biometrics_policy.sh -f