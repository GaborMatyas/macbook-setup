#!/usr/bin/env bash

CASKS=(
    slack
    obsidian
    visual-studio-code
    vlc
    rectangle # position your windows with keyboard shortcuts just like in Windows OS
    discord
    firefox@developer-edition
    obs
    google-chrome
    microsoft-edge
    alt-tab
    raycast # alternative for Spotlight search, handling file/app opening, calculator https://www.youtube.com/watch?v=JsZpAXFj8vM
    stats   # manage the menu bar info section such as clock, timezone, battery percentage, visibility of apps, network and hardware details
)

echo "The following applications are available for installation with Cask brew extension:"
for app in "${CASKS[@]}"; do
    echo "- $app"
done

read -p "Do you want to install these applications? (y/n) " answer
case ${answer:0:1} in
y | Y)
    echo "Installing the apps..."
    brew tap homebrew/cask-versions
    
    # brew install --cask ${CASKS[@]}
    echo "Apps are installed with Cask brew extension"
    ;;
*)
    echo "Skipping CASKS applications installation..."
    ;;
esac
echo
