dotfiles
===============================================================================
Linux/OSX personal workspace


Installation
-------------------------------------------------------------------------------
#### Dotfiles
The only requirements are `git` and `bash`.  It's cleanest to install git from 
the [offical website](https://git-scm.com/download/).

```bash
git clone https://github.com/evitolins/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```




Applications and Utilities
-------------------------------------------------------------------------------
__Homebrew__

There are scripts to both backup and restore the homebrew environment.

- Backup `cd ~/.dotfiles/homebrew && ./backup.sh`
- Restore `cd ~/.dotfiles/homebrew && ./restore.sh`

> **brew-cask** installation requires **Xcode** to be previously installed. Make sure to install a version that is supported by your current OSX



Preferences and Settings
-------------------------------------------------------------------------------
Below are scripts and workflows to both apply and preserve desired preferences per application.

### iTerm2

#### Profile
To restore prefered color schemes, fonts, hotkeys, etc... just choose the saved
preference file.

1. Enable: _Preferences > General > "Load preferences from a custom folder or URL:"_
2. Choose or enter `~/.dotfiles/prefs/iterm2`
3. Set font: _Preferences > Profiles > Text > Font_ to `Source Code Pro for Powerline` @ 13pt

<!-- #### Patched Fonts for Agnoster Theme

_Homebrew should now install the preferred font `Source Code Pro for Powerline` automatically._

> #### Manual Installation
> If needed, you can install and choose any of the powerline supported fonts.
> 
> 1. Install Patched Fonts
> ```bash
> git clone https://github.com/powerline/fonts.git
> cd fonts
> ./install.sh
> ```
> 2. Update iTerm profile fonts with powerline font
> 3. Delete cloned repo unless you need it hanging around.
 -->


### Github
#### Add Token
This allows Github API access at a faster rate.

1. Obtain Github token from `https://github.com/settings/tokens`
2. Add env var to login script `~/.zshrc`

```
# Github Token
export HOMEBREW_GITHUB_API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXX
```


### Others...
Check the `prefs` directory for more application preferences, installation scripts and documentation.

