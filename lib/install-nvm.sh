#!/usr/bin/env bash

read -p "Do you want to install Node Version Manager (nvm)? (y/n) " answer
case ${answer:0:1} in
y | Y)
    if [ ! -f ~/.zshrc ]; then
        echo "The ~/.zshrc file does not exist, creating it"
        touch ~/.zshrc
    fi

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    . ~/.nvm/nvm.sh
    # Check if nvm is installed correctly
    if command -v nvm &>/dev/null; then
        # Get the installed nvm version
        nvm_version=$(nvm -v)
        echo "NVM installed properly, and the new version is $nvm_version"
        echo "You can check the .zshrc file, a new NVM section should be included"
    else
        echo "NVM installation FAILED!"
    fi
    ;;
*)
    echo "Skipping Node Version Manager installation..."
    ;;
esac

echo
