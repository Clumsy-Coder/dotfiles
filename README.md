# dotfiles

my configs, settings, installation scripts, etc

## Quick start

Run script and use a var file (without file extension) from [`./vars/`](./vars)

```bash
curl -fsSL https://raw.githubusercontent.com/Clumsy-Coder/dotfiles/master/bin/dotfiles.sh | bash -s -- <var filename without file extension>
```

example:

```bash
curl -fsSL https://raw.githubusercontent.com/Clumsy-Coder/dotfiles/master/bin/dotfiles.sh | bash -s -- fedora
```

### Run specific role

To run a specfic role from [`./roles/`](./roles/) directory

```bash
curl -fsSL https://raw.githubusercontent.com/Clumsy-Coder/dotfiles/master/bin/dotfiles.sh | bash -s -- <var filename> --tags <role name>
```

example:

```bash
curl -fsSL https://raw.githubusercontent.com/Clumsy-Coder/dotfiles/master/bin/dotfiles.sh | bash -s -- fedora --tags code-directory
```

example multiple roles:

```bash
curl -fsSL https://raw.githubusercontent.com/Clumsy-Coder/dotfiles/master/bin/dotfiles.sh | bash -s -- fedora --tags 'code-directory, dnf'
```

## Usage

This repo will be using Ansible to set up dotfiles, install apps, etc

command [`dotfiles`](./bin/dotfiles.sh) is used for running Ansible playbook

When running `dotfiles`, it expects a var file from [`./vars/`](./vars) directory (without the file extension).
The var file must contain a var named `default_roles`. This var will be used to run roles stored in the [`./roles`](./roles)

Ex: if a var file `foo.yaml` contains role `code-directory` and `git` in var `default_roles`; when running `dotfiles foo`, it will run roles `code-directory` and `git`

### Supported OS

dotfiles bootstrapping is supported in the following OS

- Ubuntu
- Pop!_OS
- Fedora

### Default

```bash
dotfiles <var file>
```

Ex:

```bash
dotfiles fedora
```

### Run specific roles

If you want to run a specific role, you need to provide the ansible argument `--tags <role name>`

```bash
dotfiles <var file> --tags <role name>
```

Ex:

```bash
dotfiles fedora --tags code-directory
```

### Run multiple specific roles

To run multiple specific roles, separate the roles with a comma

```bash
dotfiles <var file> --tags 'role1, role2, role3'
```

Ex:

```bash
dotfiles fedora --tags 'code-directory, git, dnf'
```

---

## How it works

This repo uses ansible and ansible-playbook to setup the OS

All dotfiles are stored in `./tools/` directory

### `./bin/dotfiles.sh`

The `./bin/dotfiles.sh` will

- Check if the dotfiles repo is cloned on to the path defined in env `DOTFILES_DIR`
- add a symbolic line of `./bin/dotfiles.sh` to `$HOME/.local/bin/dotfiles`
  - run the command `dotfiles` from any directory
- load file `./bin/colours.sh`
- load file `./bin/functions.sh`
- load file `./tools/zsh/.zshenv`
- load file `./tools/zsh/exports.zsh`
- install ansible on the supported OS
- update git submodules
- install packages from `./requirements.yaml` using ansible galaxy
- check if a var file if not provided
  - display help page
  - exit program
- check if var file doesn't exist
  - display help page and available var file names
  - exit program
- run ansible playbook using the var file provided

### Ansible

Ansible `roles` are used for specific task, Ex: Installing `NVM`, configuring `Alacritty`. Some roles
are OS specific.

A single ansible playbook is used. It loads a var file (provided by when executing `./bin/dotfiles.sh`)
which contains var `default_roles` that will run the listed roles

Ansible `vars` are used to store any variables that be used in an Ansible `role`. Ex: list of apps to install on homebrew
The directory `vars/` contains ansible var files used by ansible-playbook. Each file is corresponding
to an OS.

> [!NOTE]
> Each var file in `./vars/` directory must contain a var `default_roles`. It's a list of roles to run if not specified by the user
> Ex:
>
> ```yaml
> default_roles:
>  - code-directory
>  - apt
>  - git
>  - lazygit
>  - neofetch
>  - neovim
>  - astronvim-v4
>  - tmux
>  - nvm
> ```


---

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

- [Restructuring dotfiles for ansible](https://youtu.be/hPPIScBt4Gw)
- [geerlingguy Mac Ansible setup video](https://youtu.be/1VhPVu5EK5o?si=3dpZaRqs_Ux5GK-E)
- [geerlingguy Mac Ansible setup](https://github.com/geerlingguy/mac-dev-playbook)
- [Run Ansible playbook in a script](https://github.com/frdmn/dotfiles/tree/master)
