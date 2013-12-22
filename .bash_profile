#!/bin/bash

# Bash Display Color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:*.deb=90'

# Load Bash Config
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Added for "AutoJump"
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh