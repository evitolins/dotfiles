#!/bin/bash

# This file generates files containing all installed homebrew elements

brew tap > tap.txt
# brew list > list.txt
brew cask list > casklist.txt

echo "Skipping 'brew list > list.txt' action:"
echo "   Please consider saving brew formulas manually, until there is a cleaner way to document core formulas, verses their dependencies."
echo "   See https://blog.jpalardy.com/posts/untangling-your-homebrew-dependencies/ for more info."