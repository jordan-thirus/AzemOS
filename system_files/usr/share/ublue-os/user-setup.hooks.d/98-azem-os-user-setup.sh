#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh
version-script azem-os-user-setup user 3 || exit 0

START_MENU_DIR=.local/share/applications
if test ! -e "$HOME"/"$START_MENU_DIR"/mullvad-vpn.desktop; then
	mkdir -p "$HOME"/"$START_MENU_DIR"
	cp -f /etc/skel/"$START_MENU_DIR"/mullvad-vpn.desktop "$HOME"/"$START_MENU_DIR"/mullvad-vpn.desktop
fi
