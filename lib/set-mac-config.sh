#!/usr/bin/env bash

read -p "Do you want to change the default config values like default Finder view style with the script? (y/n) " answer
case ${answer:0:1} in
y | Y)
    echo "Changing the config values"
    echo "-> Finder: show path bar"
    defaults write com.apple.finder ShowPathbar -bool true

    echo "-> Finder: show status bar"
    defaults write com.apple.finder ShowStatusBar -bool true

    echo "-> Local search will be the default in Finder instead of Global"
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    echo "-> Use list view in all Finder windows by default"
    # Four-letter codes for the other view modes: icnv, clmv, Flwv"
    defaults write com.apple.finder FXPreferredViewStyle Nlsv

    echo "-> Automatically hide and show the Dock"
    defaults write com.apple.dock autohide -bool true

    echo "-> Show hard disks on desktop"
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

    echo "-> Show external disks on desktop"
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

    echo "-> Show CDs, DVDs, and iPods on desktop"
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    echo "-> Show connected servers on desktop"
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

    echo "-> Disable revealing desktop function on wallpaper click"
    defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

    echo "-> Finder: show all filename extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    echo "-> Disable 'show suggested and recent apps in dock'"
    defaults write com.apple.dock show-recents -bool false

    echo "-> Show folders first in the Finder window"
    defaults write com.apple.finder _FXSortFoldersFirst -boolean true

    echo "-> Reverse direction of scroll while using track pad or mouse"
    defaults write NSGlobalDomain com.apple.swipescrolldirection -boolean false

    echo
    echo "Since battery, date and time will be handled by 'State' application in the menubar, \nthe following modifications will be applied to clock"
    echo "-> Do not show Date in the menubar "
    defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false

    echo "-> Disable the display of AM/PM in the clock"
    defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

    echo "-> Hide the default Clock and Battery icons in menubar"
    for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
        defaults write "${domain}" dontAutoLoad -array \
            "/System/Library/CoreServices/Menu Extras/Battery.menu" \
            "/System/Library/CoreServices/Menu Extras/Clock.menu"
    done
    ;;
*)
    echo "Skipping the config modification"
    ;;
esac
echo
