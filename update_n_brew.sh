#!/bin/bash

# Update the OS
sudo softwareupdate -ia --verbose

# check for Homebrew and install it if not found
if [ ! -x "$(command -v brew)" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update Homebrew and packages managed by Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

# check for pip and upgrade packages managed by pip if it's installed
if [ -x "$(command -v pip3)" ]; then
    pip3 install --upgrade pip
    pip3 list --outdated | cut -d' ' -f1 | xargs -n1 pip3 install --upgrade
fi

# Remove deprecated Homebrew packages
brew cleanup --prune=2

echo "All updates have been completed."
