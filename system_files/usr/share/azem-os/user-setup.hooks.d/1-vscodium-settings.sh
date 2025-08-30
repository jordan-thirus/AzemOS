#!/usr/bin/bash

CODIUM_USER_DIR=.var/app/com.vscodium.codium/config/VSCodium/User

# Setup VSCode
if test ! -e "$HOME"/"$CODIUM_USER_DIR"/settings.json; then
	mkdir -p "$HOME"/"$CODIUM_USER_DIR"
	cp -f /etc/skel/"$CODIUM_USER_DIR"/settings.json "$HOME"/"$CODIUM_USER_DIR"/settings.json
fi
