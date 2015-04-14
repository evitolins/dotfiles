#!/bin/bash

# This file generates files containing all installed homebrew elements

brew tap > tap.txt
brew list > list.txt
brew cask list > casklist.txt
