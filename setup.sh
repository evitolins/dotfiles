#!/bin/bash
############################
# This script:
#   - Archives any existing bash and zshrc files
#   - Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#   - Optionally installs oh-my-zsh
#   - Optionally installs homebrew
#   - Optionally installs nvm and nodejs
#   - Optionally installs npm globals
############################
source "./utils.sh"


########## Variables
timestamp=$(date +%Y%m%d_%H%M%S)
dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old/$timestamp  # old dotfiles backup directory
files=".zshrc .bashrc .bash_profile .gitconfig .gitignore_global .gitk"    # list of files/folders to symlink in homedir

## OS Detection
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi


########## Functions
backup_and_link_configs () {
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    for file in $files; do
        # Archive any existing bash and zshrc files
        echo "Archiving $file -> $olddir"
        mv ~/$file $olddir/
        # Create symlinks from the home directory to any desired dotfiles in ~/dotfiles
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/$file
    done
}

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Use oh-my-zsh installer, if missing
    if [[ ! -d ~/.oh-my-zsh/ ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'osx' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}


install_homebrew () {
    /bin/bash ~/.dotfiles/homebrew/restore.sh
}

install_ruby_gems () {
    # Check if ruby is available. (should be installed via homebrew)
    # sudo gem update --system
    # sudo gem install compass
    echo "Sorry, ruby_gems install is not yet available with this script."
}

install_nvm () {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    source ~/.zshrc
    nvm install node && nvm cache clear
}

install_npm_globals () {
    /bin/bash ~/.dotfiles/npm/restore.sh
}

clone_git_repos () {
    /bin/bash ~/.dotfiles/repos/clone.sh
}


########## Prompt user for setup options...
backup_and_link_configs
ask_user "Do you wish to install oh-my-zsh?" install_zsh
if [[ $platform == 'osx' ]]; then
    ask_user "Do you wish to install homebrew?" install_homebrew
fi
ask_user "Do you wish to install nvm and latest nodejs?" install_nvm
ask_user "Do you wish to install npm globals?" install_npm_globals
ask_user "Do you wish to clone repos locally?" clone_git_repos
