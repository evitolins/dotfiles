#!/bin/bash

#shopt -s expand_aliases

# Greeting
#====================================================================
echo "welcome back ev!"


# Sources
#====================================================================
source ~/.alias_rgbnotes


# Functions
#====================================================================
#Simple HTTP server
# Paul Irish@http://www.youtube.com/watch?v=Mk-tFn2Ix6g
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

function dir2iso() {
  echo "Generating ISO: ${1} -> ${1}.iso"
    hdiutil makehybrid -iso -joliet -o ${1}.iso ${1}
}



# Aliases
#====================================================================

alias cl="clear"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ll="ls -lh"
alias cll="cl; ll;"
alias lt="ls -lht"
alias edit="open $1 -a \"Sublime Text 2\""

# SSH
alias essh="edit ~/.ssh/config"
alias lssh="cat ~/.ssh/config | grep \"Host \""

# Quick Edit
alias ea="edit ~/.bashrc"
alias sa="source ~/.bashrc"
alias la="cat ~/.bashrc"

# Useful Directories
alias snip="cd ~/Documents/projects/python/_snippets/"

# Utilities
alias dir2iso=dir2iso
alias server=server



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=$HOME/local/bin:$PATH
