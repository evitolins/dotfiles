#!/bin/bash

# Replace Sublime Text 3's User Settings with symlinked dotfiles directory
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/.dotfiles/sublime/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User