# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="ev"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow sublime osx brew bower Composer autojump)

source $ZSH/oh-my-zsh.sh

# Aliases

## Mac
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## RGB
alias ssh_public='ssh -i ~/.ssh/rgb_rackspace_rsa01 admin@104.130.140.134'
alias ssh_staging='ssh -i ~/.ssh/rgb_rackspace_rsa01 root@166.78.145.221'
alias ssh_staging2='ssh -i ~/.ssh/rgb_rackspace_rsa01 dev@23.253.241.161'

alias grab_public_config='scp -i ~/.ssh/rgb_rackspace_rsa01 admin@104.130.140.134:/var/www/rgbnotes/config.php ~/Documents/RGB_configs/config.public.php'
alias grab_old_staging_config='scp -i ~/.ssh/rgb_rackspace_rsa01 root@166.78.145.221:/var/www/rgbnotes/config.php ~/Documents/RGB_configs/config.OLDstaging.php'
alias grab_staging_config='scp -i ~/.ssh/rgb_rackspace_rsa01 dev@23.253.241.161:/var/www/rgbnotes/config.php ~/Documents/RGB_configs/config.staging.php'



# Executable PATHS
# export PATH=/Users/ev/local/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/deployd/bin:/usr/local/git/bin:$PATH
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/deployd/bin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:~/Library/Python/3.5/bin
export PATH="$PATH:`yarn global bin`"

# ------------------------------------
# Python
# ------------------------------------
# Simple python webserver
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}
alias server=server


# Virtual Env
alias ve2='virtualenv -p python2 .'
alias ve3='virtualenv -p python3 .'
alias vestart='source ./bin/activate'
alias vestop='deactivate'




# ------------------------------------
# General
# ------------------------------------
alias ea='st ~/.zshrc'
alias sa='source ~/.zshrc'
alias web='cd ~/Documents/projects/web'
alias design='cd ~/Documents/projects/design'


# ------------------------------------
# Docker alias and function
# ------------------------------------

# ------------------------------------
# Docker Machine
# - deprecated in favor of Docker for Mac
# ------------------------------------
## Start default Docker Machine
# dmcreate() { docker-machine create --driver virtualbox default }
# dmstart() { docker-machine start default }
# dmrestart() { docker-machine restart default }

## Set Docker Machine Env
# dmenv() { eval "$(docker-machine env default)" }

## Launch Docker Machine
# dmhttp() { open http://$(docker-machine ip default)$1 }
# dmhttps() { open https://$(docker-machine ip default)$1 }

## Automaticaly set Docker Machine env in new tabs
# dmenv


# ------------------------------------
# Docker
# ------------------------------------
# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove images
alias drmi="docker rmi"

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Attach Container
dattach() { docker exec -i -t $1 bash }

# Follow Container Log
alias dfollow="docker logs --follow"


export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
