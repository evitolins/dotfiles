dotfiles
===============================================================================
Linux/OSX personal workspace


Installation
-------------------------------------------------------------------------------
```bash
git clone https://github.com/evitolins/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
.buildSymlinks.sh
```


Install Extras
-------------------------------------------------------------------------------
Until a more robust install script is created, you can use these commands to extend your profile

### Apps & Shell Cmds
__Homebrew__

There are scripts to both backup and restore the homebrew environment.

- Backup `homebrew/homebrew_backup.sh`
- Restore `homebrew/homebrew_restore.sh`


### Aliases
__Sublime Text__

    sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/bin/st


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