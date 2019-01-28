#!/bin/bash

# This script clones all repos listed within the repos.txt file

REPO_PATH="/Users/${USER}/Documents/repos"
mkdir -p "${REPO_PATH}"
cd "${REPO_PATH}"

cat ~/.dotfiles/repos/repos.txt | xargs -L 1 git clone --recursive
