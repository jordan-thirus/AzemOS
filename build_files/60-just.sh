#!/usr/bin/env bash
set -xeuo pipefail

echo "=== Adding ujust commands ==="

# Add AzemOS just file
echo "import \"/usr/share/azem-os/just/95-azem-os.just\"" >>/usr/share/ublue-os/justfile
