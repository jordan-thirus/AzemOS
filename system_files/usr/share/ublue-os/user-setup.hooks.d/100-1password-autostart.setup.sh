#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh
version-script azem-os-1password user 1 || exit 0

AUTOSTART_DIR=.config/autostart

if test ! -e "$HOME"/"$AUTOSTART_DIR"/1password.desktop; then
	mkdir -p "$HOME"/"$AUTOSTART_DIR"
	cp -f /etc/skel/"$AUTOSTART_DIR"/1password.desktop "$HOME"/"$AUTOSTART_DIR"/1password.desktop
fi
