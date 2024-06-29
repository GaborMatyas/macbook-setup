#!/usr/bin/env bash

PACKAGES=(
    git
    maccy
)

echo "The following packages are available for installation:"
for app in "${PACKAGES[@]}"; do
    echo "- $app"
done

read -p "Do you want to install these applications? (y/n) " answer
case ${answer:0:1} in
y | Y)
    echo "Installing the packages..."
    brew install ${PACKAGES[@]}
    echo "Packages are installed"
    ;;
*)
    echo "Skipping the installation of packages..."
    ;;
esac
echo
