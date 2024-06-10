#!/usr/bin/env bash

echo "Restart is a good idea to apply all the changes :)"

# Prompt the user for confirmation
read -p "Do you want to restart your MacBook now? (y/n): " choice

# Convert the input to lowercase
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

# Check the user's choice
if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
    echo "Restarting your MacBook..."
    sudo shutdown -r now
else
    echo "No restart requested."
    echo "Exit"
fi
