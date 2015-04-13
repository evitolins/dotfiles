#!/bin/bash

#
# Reference:
#    http://stackoverflow.com/questions/18449064/how-do-you-migrate-a-homebrew-installation-to-a-new-location
#
# Usage:
# Generate restore script using the following command.
# 
#    ./backup-homebrew.sh >restore-homebrew.sh && chmod +x restore-homebrew.sh
#    

echo '#!/bin/bash'
echo ''
echo 'failed_items=""'
echo 'function install_package() {'
echo 'echo EXECUTING: brew install $1 $2'
echo 'brew install $1 $2'
echo '[ $? -ne 0 ] && $failed_items="$failed_items $1"  # package failed to install.'
echo '}'

# Build Tap commands
brew tap | while read tap; do echo "brew tap $tap"; done

# Build Install commands
brew list | while read item;
do
  echo "install_package $item '$(brew info $item | /usr/bin/grep 'Built from source with:' | /usr/bin/sed 's/^[ \t]*Built from source with:/ /g; s/\,/ /g')'"
done

# Return Errors
echo '[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items'
