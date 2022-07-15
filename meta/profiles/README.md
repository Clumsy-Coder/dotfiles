# meta/profiles

running a collection of dotbot configs as a profile.

Ex:

- running configs for setting up debian

- running configs for setting up fedora

- running configs for setting up macos

---

## How does it work?

A profile contains a list of dotbot configs to run as a collection. This makes it easier than manually typing out which configs to run.

Useful for when setting up dotfiles for a new OS.

The contents of the profile is read line by line and executed by `dotfiles/install-standalone` script.

Read more [ecarlson94/dotbot-template: running profile](https://github.com/ecarlson94/dotbot-template#for-installing-a-predefined-profile)

### profile contents

The profile contents will contain config files to run; as if running the config using `dotfiles/install-standalone` script.

Example: [dotbot-template/exampleOS1](https://github.com/ecarlson94/dotbot-template/blob/main/meta/profiles/exampleOS1)

#### Example

```
homebrew
git
tmux
alacritty
spacevim
```

#### Example: config with sudo

If a config needs to run with sudo, then append sudo to the end of config to run

```
apt-sudo
git
neovim-precompiled-sudo
neovim-packages
```

### ignoring dotbot configs

If you wish to ignore certain dotbot configs, add `#` at the beginning of the line you wish to ignore

Ex:

```bash
apt-sudo
# git
neovim-precompiled-sudo
# neovim-packages
```

This will only run `apt-sudo` and `neovim-precompiled-sudo`

---

## Usage

If you wish to run a profile, then run the following command.

- NOTE: don't write the file extension

- NOTE: run the script from repo home folder `dotfiles/`. **NOT** `dotfiles/meta/profiles/`

```bash
./install-profile <profile ...>
```

Ex:

```bash
./install-profile macos
```

```bash
./install-profile raspberrypi-pihole
```

```bash
./install-profile debian-terminal debian-gui
```

---

## File/Directory structure

<!--
Quick tip: to generate tree structure with URL, run the following command
tree meta/profiles -H "."
-->

<pre>
<a href="../../../../">dotfiles/</a>meta/profiles/
├── <a href="./debian-gui">debian-gui</a>
├── <a href="./debian-terminal">debian-terminal</a>
├── <a href="./fedora-gui">fedora-gui</a>
├── <a href="./fedora-terminal">fedora-terminal</a>
├── <a href="./macos">macos</a>
└── <a href="./raspberrypi-pihole">raspberrypi-pihole</a>
</pre>

---
