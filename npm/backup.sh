#!/bin/bash

# Lists installed globals by package name, and stores in npm_global.txt

echo "Warning: Explicitly installed NPM packages can be missed if they are included as a dependency of another package."
npm list --global --depth 0 --parseable true | grep node_modules | rev | cut -d '/' -f1 | rev > ~/.dotfiles/npm/npm_global.txt
