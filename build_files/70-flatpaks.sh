#!/bin/bash

set -ouex pipefail

install -Dm0644 -t /etc/ublue-os/ /ctx/flatpaks/*.list
