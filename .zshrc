# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="ev"

plugins=()
plugins+=(brew)
plugins+=(git)
# plugins+=(osx)
# plugins+=(zsh-nvm)

source $ZSH/oh-my-zsh.sh

# ------------------------------------
# MacOS
# ------------------------------------
# alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


# ------------------------------------
# Python
# ------------------------------------
# Virtual Env
alias ve3='virtualenv -p python3 .'
alias vestart='source ./bin/activate'
alias vestop='deactivate'


# ------------------------------------
# General
# ------------------------------------
alias ea='st ~/.zshrc'
alias sa='source ~/.zshrc'


# ------------------------------------
# Git
# ------------------------------------
# Create patch file from all staged items in current git repo.
# The file name will be labeled with the current commit hash.
gitpatch() {
    hash="$(git rev-parse --short HEAD)"

    if [ -z "$hash" ]
    then
          echo "No git commit hash was found"
    else
        git diff --cached --binary > ${hash}.patch
    fi
}

newrepo() {
	local name=$1
	mkdir $name && cd $name && echo "# ${name}" > "README.md" && git init && git add . && git commit -m "initial commit"
}


# ------------------------------------
# App Setup and Autocomplete
# ------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
