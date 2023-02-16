#!/bin/bash

# Update the OS
sudo softwareupdate -ia --verbose

# Update Homebrew and packages managed by Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

# Update pip and packages managed by pip
if [ -x "$(command -v pip3)" ]; then
  pip3 install --upgrade pip
  pip3 list --outdated | cut -d' ' -f1 | xargs -n1 pip3 install --upgrade
fi

# Remove deprecated Homebrew packages
brew cleanup --prune=2

echo "All updates have been completed."
