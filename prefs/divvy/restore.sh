#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
SETTINGS="$DIR/divvySettings" 

# Restore Divvy settings if they exist
if [ ! -f $SETTINGS ]; then
	echo "File $SETTINGS does not exist"
else
	url=$(<$SETTINGS)
	open $url
	echo "Divvy settings restored"
fi