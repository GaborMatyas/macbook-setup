#!/usr/bin/env bash

read -p "Do you want to install Alacrity as your terminal? (y/n) " answer
case ${answer:0:1} in
y | Y)
    echo "Installing Alacritty terminal..."
    brew install --cask alacritty --no-quarantine

    LIBDIR="$(dirname "${BASH_SOURCE[0]}")"

    # Checking if Alacritty is installed correctly
    if which alacritty >/dev/null; then
        echo "Alacritty is installed correctly."
    else
        echo "Alacritty is not installed correctly, skipping the further steps that are connected with its setups."
        exit
    fi

    echo
    echo "-> Installing nerd fonts for Alacritty"
    brew install font-meslo-lg-nerd-font

    echo
    echo "-> Copying config and theme files for Alacritty"
    mkdir -p ~/.config/alacritty

    configFile="$LIBDIR/alacritty.toml"
    themeFile="$LIBDIR/ayu-mirage-theme.toml"
    dest_dir="$HOME/.config/alacritty"

    if [ ! -f "$configFile" ]; then
        echo "Error: File $configFile does not exist."
        exit
    fi

    if [ ! -d "$dest_dir" ]; then
        echo "Error: Destination directory $dest_dir does not exist."
        exit
    fi

    if cp "$configFile" "$dest_dir"; then
        echo "-> File $configFile has been copied to $dest_dir"
    else
        echo "Error: Failed to copy $configFile to $dest_dir. Do you have sufficient permissions?"
        exit
    fi

    if [ ! -f "$themeFile" ]; then
        echo "Error: File $themeFile does not exist."
        exit
    fi

    if cp "$themeFile" "$dest_dir"; then
        echo "-> File $themeFile has been copied to $dest_dir"
    else
        echo "Error: Failed to copy $themeFile to $dest_dir. Do you have sufficient permissions?"
        exit
    fi

    echo "-> Installing Starship expansion"
    brew install starship

    echo
    echo "-> Adding necessary .zshrc config file content"
    new_zshrc_config_source="$LIBDIR/zshrc-content-to-add.txt"
    zshrc_config_file="$HOME/.zshrc"

    # Check if the files exist
    if [ ! -f "$new_zshrc_config_source" ]; then
        echo "Error: File $new_zshrc_config_source does not exist."
        exit 1
    fi

    if [ ! -f "$zshrc_config_file" ]; then
        echo "Error: File $zshrc_config_file does not exist."
        exit 1
    fi

    # Append the content
    cat "$new_zshrc_config_source" >>"$zshrc_config_file"
    echo "Content of $new_zshrc_config_source has been appended to $zshrc_config_file"

    echo
    echo "-> Reloading source to apply changes"
    source ~/.zshrc
    echo

    echo "-> Setting up TMUX to handle multiple terminal tabs in one window"
    brew install tmux

    # TODO implement copy .tmux.conf file from lib folder to mac's home directory
    ;;
*)
    echo "Skipping Alacritty terminal installation..."
    ;;
esac
