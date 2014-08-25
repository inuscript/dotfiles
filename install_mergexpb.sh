#!/bin/sh
EXECUTABLE_URL='https://github.com/simonwagner/mergepbx/releases/download/v0.5/mergepbx'
INSTALL_PATH='/usr/local/bin/mergepbx'

set -xe

curl --silent -L "$EXECUTABLE_URL" > "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

git config --global merge.mergepbx.name 'Xcode project files merger'
git config --global merge.mergepbx.driver 'mergepbx %O %A %B'
git config --global merge.mergepbx.note 'auto-generated configuration by `cpad manifest ios`'
