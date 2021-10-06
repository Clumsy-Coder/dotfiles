# dotfiles

terminal config for installing applications and setting up shell config

Ex:

- installing applications from APT
- Setting up all your custom aliases
- Environment variables
- Vim config
- Tmux config
- Loading plugins for ZSH

---

<!-- TOC -->

- [dotfiles](#dotfiles)
- [Quick start](#quick-start)
  - [Debian based OS](#debian-based-os)
  - [Note: Powerline fonts](#note-powerline-fonts)
- [Directory deepdive](#directory-deepdive)
  - [index.sh](#indexsh)
  - [alias/](#alias)
  - [environment/](#environment)
    - [environment.sh](#environmentsh)
    - [exports.sh](#exportssh)
    - [antigen/](#antigen)
    - [exports/](#exports)
    - [neofetch/](#neofetch)
    - [theme/](#theme)
  - [setup/](#setup)
    - [debian/](#debian)
      - [install.sh](#installsh)
      - [programs/](#programs)
        - [applist](#applist)
        - [gui-based/](#gui-based)
        - [terminal-based/](#terminal-based)
  - [tools/](#tools)
    - [tools.sh](#toolssh)
    - [neovim/](#neovim)
    - [tmux/](#tmux)
      - [tmux.sh](#tmuxsh)
      - [hotkeys.tmux.conf](#hotkeystmuxconf)
      - [plugins.tmux.conf](#pluginstmuxconf)
      - [theme.tmux.conf](#themetmuxconf)
      - [tmux.conf](#tmuxconf)
    - [vim/](#vim)
      - [vim.sh](#vimsh)
      - [editor.vim](#editorvim)
      - [hotkeys.vim](#hotkeysvim)
      - [plugins.vim](#pluginsvim)
        - [VimPlug commands](#vimplug-commands)
          - [Installing Vim plugins](#installing-vim-plugins)
          - [Updating Vim plugins](#updating-vim-plugins)
      - [pluginConfig/](#pluginconfig)
  - [Directory tree view](#directory-tree-view)

<!-- /TOC -->

# Quick start

## Debian based OS

clone repo in home directory **~**

`git clone https://github.com/clumsy-coder/dotfiles`

run install script

`~/dotfiles/setup/debian/install.sh`

## Note: Powerline fonts

The dotfiles .zshrc uses Powerline font for the terminal. This means the terminal used (iterm2, default debian terminal, etc) needs to have their fonts changed that supports powerline fonts.

Check [install powerline font](https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#step-2-install-a-powerline-font)

# Directory deepdive

What each directory and file is used for

---

## index.sh

[`dotfiles/index.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/index.sh)

The main dotfile index used when starting ZSH.

It will run in `~/.zshrc` using `source ~/dotfiles/index.sh`.

Will load relevant ENV variables, oh-my-zsh plugins, tools configs (tmux, vim, Powerline, etc) and alias (based on the OS running).

- `~/dotfiles/environment/environment.sh`
  - Load Powerline terminal config.
  - Load oh-my-zsh plugins
  - Load ENV exports based on the OS running
- `~/dotfiles/tools/tools.sh`
  - Load tmux config
  - Load vim config
  - Load neovim config
- `~/dotfiles/alias/alias.sh`
  - Load alias based on the OS running

Runs the following:

- [`~/dotfiles/environment/environment.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/environment.sh). Check [environment.sh](#environmentsh) section.
- [`~/dotfiles/tools/tools.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tools.sh). Check [tools.sh](#tools) section.
- [`~/dotfiles/alias/alias.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/alias/alias.sh). Check [alias.sh](#alias) section.

## alias/

[`dotfiles/alias/alias.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/alias/alias.sh) will load alias commands based on the OS

Runs the following:

- [`dotfiles/alias/debian/alias.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/alias/debian/alias.sh) for debian based OS.
- [`dotfiles/alias/osx/alias.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/alias/osx/alias.sh) for MacOS.

---

## environment/

Setting up config for ZSH in runtime.

### environment.sh

[`~/dotfiles/environment/environment.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/environment.sh)

Load config for antigen, oh-my-zsh powerline theme, ENV exports, etc

Runs shell script when using the terminal:

- Powerline theme. [`dotfiles/environment/theme/powerlevel9k/powerlevel9k.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/theme/powerlevel9k/powerlevel9k.sh). Check [theme/](#theme)
- Running [`dotfiles/environment/exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports.sh). Check [exports.sh](#exportssh)
- Running [`dotfiles/environment/antigen/antigen.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/antigen/antigen.sh). Check [antigen/](#antigen)

### exports.sh

[`dotfiles/environment/exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports.sh)

Export ENV based on the OS running.

- [`dotfiles/environment/exports/debian-exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports/debian-exports.sh) for debian based OS.
- [`dotfiles/environment/exports/osx-exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports/osx-exports.sh) for MacOS.

### antigen/

ZSH and oh-my-zsh plugin manager

[`dotfiles/environment/antigen/antigen.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/antigen/antigen.sh)

Does the following:

- Check if antigen is installed
  - If Antigen is NOT installed, download and install Antigen plugin manager
- Load Antigen
- Load oh-my-zsh plugins using Antigen

### exports/

Load ENV variables used based on the OS

[`dotfiles/environment/exports/debian-exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports/debian-exports.sh)

[`dotfiles/environment/exports/osx-exports.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/exports/osx-exports.sh)

### neofetch/

Custom config for displaying system information.

[`dotfiles/environment/neofetch/config.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/neofetch/config.conf)

Note: By default neofetch WON'T use the config.

To use the config use `neofetch --config ~/dotfiles/environment/neofetch/config.conf`

### theme/

Powerline theme. Uses Powerlevel9k for oh-my-zsh

[`dotfiles/environment/theme/powerlevel9k/powerlevel9k.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/environment/theme/powerlevel9k/powerlevel9k.sh)

NOTE: make sure Powerline font is installed and used by the terminal (ex: iterm2)

check [Powerline font](#note-powerline-fonts)

---

## setup/

Contains installation files depending on OS.
These are meant to install terminal and/or GUI based applications for the OS.

### debian/

#### install.sh

Install script to run for debian based OS.

What [`dotfiles/setup/debian/install.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/setup/debian/install.sh) does

1. Asks if you wish to install Terminal and GUI based software (outside of APT)
2. Update and upgrade APT packages
3. Install APT packages from [`dotfiles/setup/debian/programs/applist`](https://github.com/Clumsy-Coder/dotfiles/blob/master/setup/debian/programs/applist)
4. Install software outside of APT repos
   1. Install terminal based software. [`dotfiles/setup/debian/programs/terminal-based/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/setup/debian/programs/terminal-based)
   2. Install GUI based software. [`dotfiles/setup/debian/programs/gui-based/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/setup/debian/programs/gui-based)
5. Install Vim plugins
6. Install ZSH and Oh-my-zsh
7. Download default .zshrc from oh-my-zsh (will overwrite existing ~/.zshrc)
8. Source dotfiles ZSH config to ~/.zshrc
   1. `source ~/dotfiles/index.sh`
9. Install oh-my-zsh plugins (done with antigen plugin manager)

#### programs/

##### applist

Contains all APT packages to be installed.

[`dotfiles/setup/debian/programs/applist`](https://github.com/Clumsy-Coder/dotfiles/blob/master/setup/debian/programs/applist)

##### gui-based/

Contains scripts to install GUI based applications that couldn't be installed using `dotfiles/setup/debian/programs/applist`

Ex: Installing VScode requires extra work.

- Adding VScode PPA
- adding gpg cert
- installing VScode
- installing VScode extensions

NOTE: [`dotfiles/setup/debian/install.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/setup/debian/install.sh) will run all bashscript files in [`dotfiles/setup/debian/programs/gui-based/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/setup/debian/programs/gui-based) folder

##### terminal-based/

Contains scripts to install terminal based applications that couldn't be installed using `dotfiles/setup/debian/programs/applist`

Ex: Installing Docker, NodeJS, NVM

Note: [`dotfiles/setup/debian/install.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/setup/debian/install.sh) will run all bashscript files in [`dotfiles/setup/debian/programs/terminal-based/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/setup/debian/programs/terminal-based) folder

---

## tools/

Custom config for specific tools.
Ex: config for Vim, tmux, etc

### tools.sh

Runs all the scripts in [`dotfiles/tools/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/tools) sub-folders

### neovim/

Uses Vim config [`dotfiles/tools/vim/.vimrc`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/.vimrc) to run neovim

### tmux/

#### tmux.sh

[`dotfiles/tools/tmux/tmux.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/tmux.sh)

Creates a symbolic link of [`dotfiles/tools/tmux/tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/tmux.conf) to `~/.tmux.conf`

tmux will load the other `.tmux.conf` without the need to copy the files over.

#### hotkeys.tmux.conf

Contains all the hotkeys used to operate tmux.

NOTE: this was made for **iterm2**. At the time this was being developed on **MacOS**. So in order for the hotkeys to work on a debian based terminal, some extra work needs to be done. Such as send extra commands when a specific hotkey is pressed (the terminal catches it and sends out it corresponding hotkeys to the shell).

Check [`dotfiles/tools/tmux/hotkeys.tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/hotkeys.tmux.conf) for more details

Summary:

- **Prefix** is changed to `Ctrl + a`
- **Meta** is changed to `Alt`
- **S** is changed to `Shift`
- Create a vertical pane: `prefix + |`
- Create a horizontal pane: `prefix + -`
- Reload tmux config: `prefix + r`
- Switch active pane
  - Go to up pane: `Meta + ↑`
  - Go to down pane: `Meta + ↓`
  - Go to left pane: `Meta + ←`
  - Go to right pane: `Meta + →`
- Resizing active pane
  - Resize pane up: `prefix + ↑`
  - Resize pane down: `prefix + ↓`
  - Resize pane left: `prefix + ←`
  - Resize pane right: `prefix + →`
- Switch window of current tmux session
  - Switch window left: `shift + meta + ←`
  - Switch window right: `shift + meta + →`

#### plugins.tmux.conf

[`dotfiles/tools/tmux/plugins.tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/plugins.tmux.conf)

Plugins for tmux. Tmux plugin manager is installed automatically in [`dotfiles/tools/tmux/tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/tmux.conf)

#### theme.tmux.conf

Some custom config for tmux theme.

Using https://github.com/egel/tmux-gruvbox as the main tmux theme.

#### tmux.conf

[`dotfiles/tools/tmux/tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/tmux.conf)

- Set tmux config.
- Load tmux config
  - [`dotfiles/tools/tmux/hotkeys.tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/hotkeys.tmux.conf)
  - [`dotfiles/tools/tmux/plugins.tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/plugins.tmux.conf)
  - [`dotfiles/tools/tmux/theme.tmux.conf`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/tmux/theme.tmux.conf)
- Load tmux plugin manager
  - Download tmux plugin manager **IF** not installed
- Load tmux plugins

### vim/

Config for Vim.

- Vim editor config
- hotkeys
- plugins
- custom plugin config

#### vim.sh

[`dotfiles/tools/vim/vim.sh`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/vim.sh)

Creates a symbolic link of [`dotfiles/tools/vim/.vimrc`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/.vimrc) to `~/.vimrc`

#### editor.vim

[`dotfiles/tools/vim/editor.vim`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/editor.vim)

Setting basic editor config. Ex

- show line number
- set tab size
- setting theme
- using airline powerline font

#### hotkeys.vim

[`dotfiles/tools/vim/hotkeys.vim`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/hotkeys.vim)

- Toggle NerdTree with `Ctrl + n`
- Toggle NERDCommenterToggle comments for current line with `Ctrl + /`
  - **NOTE:** NERDCommenterToggle uses `//` in normal mode to toggle comments. iTerm2 has hotkey `Ctrl + /` to send `//` to vim

#### plugins.vim

[`dotfiles/tools/vim/plugins.vim`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/plugins.vim)

All the plugins installed for Vim.

Does the following:

- Check if VimPlug is installed
  - Download VimPlug is its NOT installed
- Load vim plugins
- Load custom plugin configs in [`dotfiles/tools/vim/pluginConfig/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/tools/vim/pluginConfig) folder

##### VimPlug commands

Check [VimPlug commands ](https://github.com/junegunn/vim-plug#commands)

###### Installing Vim plugins

You can install vim plugins with `:PlugInstall` in vim running under NORMAL mode

or you can install Vim plugins in **bash, or zsh, etc** with `vim +PlugInstall +qall`

###### Updating Vim plugins

You can update vim plugins in vim using `:PlugUpdate` under NORMAL mode

or you can update Vim plugins in **bash, or zsh, etc** with `vim +PlugUpdate +qall`

#### pluginConfig/

Custom plugin configs to load.

[`dotfiles/tools/vim/pluginConfig/*`](https://github.com/Clumsy-Coder/dotfiles/tree/master/tools/vim/pluginConfig)

The files in this folder are being run in [`dotfiles/tools/vim/plugins.vim`](https://github.com/Clumsy-Coder/dotfiles/blob/master/tools/vim/plugins.vim)

---

## Directory tree view

```
.
├── alias
│   ├── debian
│   │   └── alias.sh
│   ├── osx
│   │   └── alias.sh
│   └── alias.sh
├── apps
│   ├── debian
│   ├── osx
│   │   ├── README.md
│   │   ├── applist
│   │   ├── casklist
│   │   └── taplist
│   └── README.md
├── environment
│   ├── antigen
│   │   └── antigen.sh
│   ├── exports
│   │   ├── debian-exports.sh
│   │   └── osx-exports.sh
│   ├── images
│   │   ├── one-punch-man-ok-rs.jpg
│   │   └── one-punch-man.png
│   ├── neofetch
│   │   └── config.conf
│   ├── theme
│   │   └── powerlevel9k
│   │       └── powerlevel9k.sh
│   ├── environment.sh
│   └── exports.sh
├── setup
│   └── debian
│       ├── programs
│       │   ├── gui-based
│       │   │   └── vscode.sh
│       │   ├── terminal-based
│       │   │   ├── docker.sh
│       │   │   ├── node.sh
│       │   │   └── nvm-npm-node-packages.sh
│       │   └── applist
│       └── install.sh
├── tools
│   ├── neovim
│   │   ├── init.vim
│   │   └── neovim.sh
│   ├── tmux
│   │   ├── hotkeys.tmux.conf
│   │   ├── plugins.tmux.conf
│   │   ├── theme.tmux.conf
│   │   ├── tmux.conf
│   │   └── tmux.sh
│   ├── vim
│   │   ├── pluginConfig
│   │   │   ├── nerdcommenter.config.vim
│   │   │   └── nerdtree.config.vim
│   │   ├── editor.vim
│   │   ├── hotkeys.vim
│   │   ├── plugins.vim
│   │   └── vim.sh
│   └── tools.sh
├── CHANGELOG.md
├── LICENSE
├── README.md
├── index.sh
├── package.json
└── yarn.lock

23 directories, 43 files

```
