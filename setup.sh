#!/usr/bin/env bash

echo "Starting Setup script for setting up a new macos machine"

cd || exit
PWD=$(pwd)
echo "The current working directory is: $PWD"

DIR="$(dirname "$0")"
# if [ "$EUID" -ne 0 ]; then
#     echo "Please run as root, use 'sudo' for the script."
#     exit
# fi

source "$DIR/lib/check-homebrew.sh"
source "$DIR/lib/install-packages.sh"
source "$DIR/lib/install-casks-apps.sh"
source "$DIR/lib/install-nvm.sh"
source "$DIR/lib/set-mac-config.sh"
source "$DIR/lib/setup-alacritty.sh"

echo
echo "Setup is complete, closing everything to apply the changes"
killall Finder
killall Dock
killall SystemUIServer

echo ""
source "$DIR/lib/print-further-steps.sh"

echo
echo "Macbook setup completed!"

source "$DIR/lib/restart-mac.sh"
