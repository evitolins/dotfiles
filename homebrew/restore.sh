#!/bin/bash

# This file restores homebrew packages from generated backup files

if ! command -v brew >/dev/null; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
     echo "Homebrew already installed"
fi

cat tap.txt | xargs brew tap
cat list.txt | xargs brew install
cat casklist.txt | xargs brew cask install
