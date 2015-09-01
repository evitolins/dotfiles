dotfiles
===============================================================================
Linux/OSX personal workspace


Installation
-------------------------------------------------------------------------------
```bash
git clone https://github.com/evitolins/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./buildSymlinks.sh
```


Install Extras
-------------------------------------------------------------------------------
Until a more robust install script is created, you can use these commands to extend your profile

### Add Github Token
This allows Github API access at a faster rate.

1. Obtain Github token from `https://github.com/settings/tokens`
2. Add env var to login script `~/.zshrc`

```
# Github Token
export HOMEBREW_GITHUB_API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXX
```


### Apps & Shell Cmds
__Homebrew__

There are scripts to both backup and restore the homebrew environment.

- Backup `homebrew/backup.sh`
- Restore `homebrew/restore.sh`

> **brew-cask** installation requires **Xcode** to be previously installed. Make sure to install a version that is supported by your current OSX


### Aliases
__Sublime Text__

	# Root Installation
    sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/st

    # User Installation (brew cask) 
    sudo ln -s "/Users/${USER}/Applications/Sublime Text 2.app" /usr/bin/st


### Themes & Fonts
__Solarized for iTerm__

1. Clone repo from `git clone https://github.com/altercation/solarized.git`
2. Install in iTerm `Preferences > Colors > Load Presets > Import`
3. Delete cloned repo unless you need it hanging around.

__Patched Fonts for Agnoster Theme__

1. Install Patched Fonts

        git clone https://github.com/powerline/fonts.git
        cd fonts
        ./install.sh

2. Update iTerm profile fonts with powerline font
3. Delete cloned repo unless you need it hanging around.

> You may need to wait for the OS's font cache to reset.