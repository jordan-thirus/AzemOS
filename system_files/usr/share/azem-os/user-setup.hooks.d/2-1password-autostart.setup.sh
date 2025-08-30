#!/usr/bin/bash

AUTOSTART_DIR=.config/autostart

# Setup VSCode
if test ! -e "$HOME"/"$AUTOSTART_DIR"/1password.desktop; then
	mkdir -p "$HOME"/"$AUTOSTART_DIR"
	cp -f /etc/skel/"$AUTOSTART_DIR"/1password.desktop "$HOME"/"$AUTOSTART_DIR"/1password.desktop
fi
