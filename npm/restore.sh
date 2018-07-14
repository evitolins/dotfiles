#!/bin/bash

# This file restores global npm packages
cat ~/.dotfiles/npm/npm_global.txt | xargs npm install --global --quiet