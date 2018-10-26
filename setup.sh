#!/bin/bash
############################
# Edited from:
# @https://raw.github.com/michaeljsmalley/dotfiles/master/makesymlinks.sh
# 
# install.sh
# This script:
#   1) Archives any existing bash and zshrc files
#   2) Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#   3) Optionally installs oh-my-zsh
#   4) Optionally installs homebrew and caskroom apps
#   5) Optionally installs npm globals
############################

########## Variables

timestamp=$(date +%Y%m%d_%H%M%S)
dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old/$timestamp  # old dotfiles backup directory
files=".zshrc .bashrc .bash_profile .gitconfig .gitignore_global .gitk"    # list of files/folders to symlink in homedir
platform='unknown'

## OS Detection
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi


########## Functions

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/.oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git $dir/.oh-my-zsh/
        ln -s $dir/.oh-my-zsh/ ~/.oh-my-zsh
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

install_npm_globals () {
    /bin/bash ~/.dotfiles/npm/restore.sh
}




########## Tasks

# 1) Archives any existing bash and zshrc files
# 2) Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
for file in $files; do
    echo "Archiving $file -> $olddir"
    mv ~/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# 3) Optionally installs oh-my-zsh
# @http://stackoverflow.com/questions/226703/how-do-i-prompt-for-input-in-a-linux-shell-script
while true; do
    read -p "Do you wish to install zsh? (y/n) " yn
    case $yn in
        [Yy]* ) install_zsh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes[y] or no[n].";;
    esac
done

# 4) Optionally installs homebrew and caskroom apps
if [[ $platform == 'osx' ]]; then
    while true; do
        read -p "Do you wish to install homebrew? (y/n) " yn
        case $yn in
            [Yy]* ) install_homebrew; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes[y] or no[n].";;
        esac
    done
fi

# 5) Optionally installs npm globals (NOTE: node & npm is installed via homebrew)
while true; do
    read -p "Do you wish to install npm globals? (y/n) " yn
    case $yn in
        [Yy]* ) install_npm_globals; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes[y] or no[n].";;
    esac
done

