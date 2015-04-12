# dotfiles
Linux/OSX personal workspace


## Installation
1. Clone this repo within your home directory.

        git clone https://github.com/evitolins/dotfiles.git ~/.dotfiles
2. Build symlinks and install oh-my-zsh

        cd ~
        ./.dotfiles/buildSymlinks.sh



## Install Extras
Until a more robust install script is created, you can use these commands to extend your profile

### Aliases
__Sublime Text__

    sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/st
