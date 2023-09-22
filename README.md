# dotfiles

my configs, settings, installation scripts, etc

## Quick start

Clone repo

```bash
git clone https://github.com/clumsy-coder/dotfiles ~/dotfiles && cd ~/dotfiles
```

Run Ansible playbooks

```bash
./dotfiles macos
```

Will install homebrew, homebrew apps, setup MacOS docks, configure dotfiles

---

## Usage

This repo will be using Ansible to setup dotfiles, install apps, etc

file `./dotfiles` is used for running Ansible playbook

### Running a playbook

run the script `./dotfiles` and the name the playbook in [`./playbooks/`](./playbooks/) directory

```bash
./dotfiles {playbook name}
```

Ex:

```bash
./dotfiles macos
```

### Running a specific role from a playbook

Each Ansible role has a tag attached to it. Ex: `Alacritty`, `terminal`
Pass a flag `--tags` to run a role with that specific tagname

run the script `./dotfiles`, and the name the playbook in [`./playbooks/`](./playbooks/)
directory, and a flag, which tags to run and add, which tag to use from [`./roles/`](./roles/)

```bash
./dotfiles {playbook name} --tags "tagname"
```

Ex:

```bash
./dotfiles macos --tags "alacritty"
```

#### Running multiple tags from a playbook

```bash
./dotfiles {playbook name} --tags "tagname, tagname"
```

Ex:

```bash
./dotfiles macos --tags "alacritty, nvm"
```

---

## How does it work?

All dotfiles are stored in `./tools/` directory

A tool named `Ansible` is used to setup dotfiles

Ansible `roles` are used for specific task, Ex: Installing `NVM`, configuring `Alacritty`

Ansible `playbooks` are used to run a collection of Ansible `roles`. Useful to run a collection of roles in one command

Ansible `vars` are used to store any variables that be used in an Ansible `role`. Ex: list of apps to install on homebrew

---

## File/Folder structure

<pre>
dotfiles/
├── <a href="./.editorconfig">.editorconfig</a>
├── <a href="./.github/">.github/</a>
├── <a href="./.gitignore">.gitignore</a>
├── <a href="./.gitmodules">.gitmodules</a>
├── <a href="./.luacheckrc">.luacheckrc</a>
├── <a href="./.stylua.toml">.stylua.toml</a>
├── <a href="./.yamllint">.yamllint</a>
├── <a href="./LICENSE">LICENSE</a>
├── <a href="./README.md">README.md</a>
├── <a href="./ansible.cfg">ansible.cfg</a>                     # Ansible configs
├── <a href="./dotbot-readme.md">dotbot-readme.md</a>                # Old docs for dotbot
├── <a href="./dotfiles">dotfiles</a>                        # Script to run Ansible
├── <a href="./hosts">hosts</a>                           # Ansible hosts
├── <a href="./install-profile">install-profile</a>                 # used by dotbot. No longer in use
├── <a href="./install-standalone">install-standalone</a>              # used by dotbot. No longer in use
├── <a href="./docs/">docs/</a>                           # documentation assets. Ex: screenshots
├── <a href="./meta/">meta/</a>                           # dotbot configs and profiles. No longer in use
├── <a href="./playbooks/">playbooks/</a>                      # Ansible playbooks
├── <a href="./requirements.yaml">requirements.yaml</a>               # Ansible Galaxy. needed before running Ansible
├── <a href="./roles/">roles/</a>                          # Ansible roles
├── <a href="./tools/">tools/</a>                          # dotfile configs
└── <a href="./vars/">vars/</a>                           # Ansible vars
</pre>

## Inspiration

- [geerlingguy Mac Ansible setup](https://github.com/geerlingguy/mac-dev-playbook)
- [Run Ansible playbook in a script](https://github.com/frdmn/dotfiles/tree/master)
