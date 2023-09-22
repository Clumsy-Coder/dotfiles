# :warning: `Dotbot` is no longer being used. Replaced with ansible. check [README.md](../../README.md) :warning:

# meta/configs/

dotbot config files.

Used for running dotbot config for specific use case.

Ex:

- install apt packages

- link git config files

- link vim config files

---

## How does it work?

The config file is read by `dotbot` and then executed according what the config file contents says.

dotbot configs are stored in `dotfiles/meta/configs/` folder. These contain `YAML` files. Using [anishathalye/dotbot: configuration](https://github.com/anishathalye/dotbot#configuration) to define the tasks to be performed.

Simply, there are 4 tasks that can be performed:

- link: create symbol link of file

- create: create directories

- clean: remove dead symbolic links

- shell: run shell commands

### Using XDG ENV variables

dotbot configs using ENV variables are loaded from [`dotfiles/tools/zsh/.zshenv`](../../tools/zsh/.zshenv)

[`install-standalone`](../../install-standalone) will load the ENV before running dotbot configs

Ex: [./apt.yaml](./apt.yaml) is using variable `$DOTBOT_INSTALL_LIST_PATH`. This is set in [`dotfiles/tools/zsh/.zshenv`](../../tools/zsh/.zshenv)

---

## Usage

If you wish to run one of the configs, then run the following command.

- NOTE: don't write the file extension
- NOTE: run the script from repo home folder `dotfiles/`. **NOT** `dotfiles/meta/configs/`

### Running a single config

```bash
./install-standalone <config-file>
```

Example:

```bash
./install-standalone spacevim
```

### Running a config with sudo

If you need to run a config using sudo, then append `-sudo` at the end of the config you wish to run

```bash
./install-standalone <config-file>-sudo
```

Example:

```bash
./install-standalone apt-sudo
```

### Running multiple configs in one command

You can run multiple by adding more arguments to the command.

```bash
./install-standalone <config-file> <config-file> <config-file>
```

Example:

```bash
./install-standalone spacevim apt-sudo nerdfonts
```

---

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." meta/configs -L 1
-->

<pre>
<a href="../../../../">dotfiles/</a>meta/configs/
├── <a href="./alacritty.yaml">alacritty.yaml</a>                             link <a href="https://github.com/alacritty/alacritty">alacritty</a> config files
├── <a href="./apt-fast-gui.yaml">apt-fast-gui.yaml</a>                          install apt terminal packages using <a href="https://github.com/ilikenwf/apt-fast">apt-fast</a>
├── <a href="./apt-fast-terminal.yaml">apt-fast-terminal.yaml</a>                     install apt gui packages using <a href="https://github.com/ilikenwf/apt-fast">apt-fast</a>
├── <a href="./apt-fast.yaml">apt-fast.yaml</a>                              install <a href="https://github.com/ilikenwf/apt-fast">apt-fast</a>
├── <a href="./apt-gui.yaml">apt-gui.yaml</a>                               install apt gui packages
├── <a href="./apt.yaml">apt.yaml</a>                                   install apt terminal packages
├── <a href="./astronvim.yaml">astronvim.yaml</a>                             install <a href="https://github.com/AstroNvim/AstroNvim">AstroNvim</a>
├── <a href="./colorscript.yaml">colorscript.yaml</a>                           install <a href="https://gitlab.com/dwt1/shell-color-scripts">Colorscript</a>
├── <a href="./debian-apt-sources.yaml">debian-apt-sources.yaml</a>                    add apt sources in debian
├── <a href="./dnf-copr.yaml">dnf-copr.yaml</a>                              enable Fedora copr package repos
├── <a href="./dnf-gui.yaml">dnf-gui.yaml</a>                               install Fedora gui packages
├── <a href="./dnf.yaml">dnf.yaml</a>                                   install Fedora terminal packages
├── <a href="./docker-debian.yaml">docker-debian.yaml</a>                         install <a href="https://www.docker.com/">Docker</a> on <a href="https://docs.docker.com/engine/install/debian/">Debian</a>
├── <a href="./docker-ubuntu.yaml">docker-ubuntu.yaml</a>                         install <a href="https://www.docker.com/">Docker</a> on <a href="https://docs.docker.com/engine/install/ubuntu/">Ubuntu</a>
├── <a href="./fail2ban.yaml">fail2ban.yaml</a>                              link fail2ban config file
├── <a href="./fix-locale.yaml">fix-locale.yaml</a>                            setting language locales
├── <a href="./git.yaml">git.yaml</a>                                   link gitconfig files
├── <a href="./go-packages.yaml">go-packages.yaml</a>                           install <a href="https://go.dev/">golang</a> packages
├── <a href="./homebrew.yaml">homebrew.yaml</a>                              install <a href="https://brew.sh/">homebrew</a> and it's packages
├── <a href="./macos-configs.yaml">macos-configs.yaml</a>                         set MacOS default settings
├── <a href="./nala-gui.yaml">nala-gui.yaml</a>                              install terminal packages using <a href="https://gitlab.com/volian/nala">nala</a>
├── <a href="./nala-terminal.yaml">nala-terminal.yaml</a>                         install gui packages using <a href="https://gitlab.com/volian/nala">nala</a>
├── <a href="./nala.yaml">nala.yaml</a>                                  install <a href="https://gitlab.com/volian/nala">nala</a> debian/ubuntu package manager
├── <a href="./neofetch.yaml">neofetch.yaml</a>                              link <a href="https://github.com/dylanaraps/neofetch">neofetch</a> config file
├── <a href="./neovim-packages.yaml">neovim-packages.yaml</a>                       install <a href="https://github.com/neovim/neovim">Neovim</a> plugins using <a href="https://github.com/wbthomason/packer.nvim">Packer</a>
├── <a href="./neovim-precompiled.yaml">neovim-precompiled.yaml</a>                    install <strong>stable</strong> precompiled <a href="https://github.com/neovim/neovim/releases/tag/stable">Neovim</a>
├── <a href="./neovim-source-build.yaml">neovim-source-build.yaml</a>                   build and install <a href="https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source">Neovim from source</a>
├── <a href="./nerdfonts.yaml">nerdfonts.yaml</a>                             install fonts from <a href="https://github.com/ryanoasis/nerd-fonts">NerdFonts</a>
├── <a href="./nvm.yaml">nvm.yaml</a>                                   install <a href="https://github.com/nvm-sh/nvm">Node version manager</a> and it's plugins
├── <a href="./ohmyzsh.yaml">ohmyzsh.yaml</a>                               install <a href="https://github.com/ohmyzsh/ohmyzsh">Oh-my-zsh</a>
├── <a href="./pihole-cron.yaml">pihole-cron.yaml</a>                           link <a href="https://pi-hole.net/">Pi-hole DNS</a> cron jobs
├── <a href="./pihole.yaml">pihole.yaml</a>                                install <a href="https://pi-hole.net/">Pi-hole DNS</a>
├── <a href="./raspberrypi-configs.yaml">raspberrypi-configs.yaml</a>                   set default configs for raspberry pi
├── <a href="./raspberrypi-unattended-upgrades.yaml">raspberrypi-unattended-upgrades.yaml</a>       link unattended upgrades config file for Raspberry pi OS
├── <a href="./rust-packages.yaml">rust-packages.yaml</a>                         install <a href="https://www.rust-lang.org/">Rust</a> packages
├── <a href="./rust.yaml">rust.yaml</a>                                  install <a href="https://www.rust-lang.org/">Rust</a>
├── <a href="./spacevim.yaml">spacevim.yaml</a>                              install <a href="https://github.com/SpaceVim/SpaceVim">SpaceVim</a>
├── <a href="./ssh-keygen.yaml">ssh-keygen.yaml</a>                            generate SSH keys and copy to device
├── <a href="./tmux.yaml">tmux.yaml</a>                                  link <a href="https://github.com/tmux/tmux">tmux</a> config files and install <a href="https://github.com/tmux-plugins/tpm">tmux plugins</a>
├── <a href="./ufw-pihole.yaml">ufw-pihole.yaml</a>                            set ufw firewall configs for pihole
├── <a href="./unbound.yaml">unbound.yaml</a>                               install <a href="https://github.com/NLnetLabs/unbound">Unbound DNS</a>
├── <a href="./vscode-debian.yaml">vscode-debian.yaml</a>                         install <a href="https://code.visualstudio.com/">VScode</a> on <a href="https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions">Debian</a>
├── <a href="./vscode-fedora.yaml">vscode-fedora.yaml</a>                         install <a href="https://code.visualstudio.com/">VScode</a> on <a href="https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions">Fedora</a>
├── <a href="./vscode-plugins.yaml">vscode-plugins.yaml</a>                        install <a href="https://marketplace.visualstudio.com/VSCode">VScode extensions</a>
└── <a href="./zsh.yaml">zsh.yaml</a>                                   link ZSH files

</pre>

---
