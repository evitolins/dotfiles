#!/bin/bash

# Summary:
# This file echo's an bash script to restore all homebrew installations.
#    
# Reference:
#    http://stackoverflow.com/questions/18449064/how-do-you-migrate-a-homebrew-installation-to-a-new-location
#    http://blog.pebblecode.com/post/47769475680/moving-homebrew-installs-to-a-new-mac
#
# Usage:
# Generate restore script using the following command.
# 
#    ./backup-homebrew.sh >restore-homebrew.sh && chmod +x restore-homebrew.sh
#    

echo '#!/bin/bash'
echo ''
echo 'failed_items=""'
echo ''
echo 'install_homebrew() {'
echo '	if ! command -v brew >/dev/null; then'
echo '		echo "Installing homebrew..."'
echo '		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
echo '  else'
echo '      echo "Homebrew already installed"'
echo '	fi'
echo '}'
echo ''
echo 'install_package() {'
echo '  echo EXECUTING: brew install $1 $2'
echo '  brew install $1 $2'
echo '  [ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.'
echo '}'
echo ''
echo 'install_cask() {'
echo '  echo EXECUTING: brew cask install $1'
echo '  brew cask install $1'
echo '  [ $? -ne 0 ] && $failed_items="$failed_items $1"  # cask failed to install.'
echo '}'
echo ''

# Install Homebrew
echo "install_homebrew"
echo ''

# Build Tap commands
brew tap | while read tap;
do
  echo "brew tap $tap";
done

# Build Install commands (also handles built-from-source)
brew list | while read item;
do
  echo "install_package $item '$(brew info $item | /usr/bin/grep 'Built from source with:' | /usr/bin/sed 's/^[ \t]*Built from source with:/ /g; s/\,/ /g')'";
done

# Build Cask Install commands
brew cask list | while read item;
do
  echo "install_cask $item";
done

# Return Errors
echo '[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items'
