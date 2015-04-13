#!/bin/bash

# This file restores homebrew packages from generated backup files

cat tap.txt | xargs brew tap
cat list.txt | xargs brew install
cat casklist.txt | xargs brew cask install
