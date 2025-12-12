#!/usr/bin/bash

source /usr/lib/ublue/setup-services/libsetup.sh
version-script azem-os-user-setup user 2 || exit 0

# Copy 1password autostart configuration
AUTOSTART_DIR=.config/autostart
if test ! -e "$HOME"/"$AUTOSTART_DIR"/1password.desktop; then
	mkdir -p "$HOME"/"$AUTOSTART_DIR"
	cp -f /etc/skel/"$AUTOSTART_DIR"/1password.desktop "$HOME"/"$AUTOSTART_DIR"/1password.desktop
fi

START_MENU_DIR=.local/share/applications
if test ! -e "$HOME"/"$START_MENU_DIR"/mullvad-vpn.desktop; then
	mkdir -p "$HOME"/"$START_MENU_DIR"
	cp -f /etc/skel/"$START_MENU_DIR"/mullvad-vpn.desktop "$HOME"/"$START_MENU_DIR"/mullvad-vpn.desktop
fi
