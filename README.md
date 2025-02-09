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

## File/Folder structure

<!--
Quick tip: to generate tree structure with URL, run the following command
tree . -L 1 -a -C --dirsfirst -H "."
-->
<pre>
dotfiles/
├── <a class="DIR" href="./.github/">.github/</a>
├── <a class="DIR" href="./bin/">bin/</a>                            # shell scripts to run dotfiles and ansible-playbook
├── <a class="DIR" href="./docs/">docs/</a>                           # documentation assets. Ex: screenshots
├── <a class="DIR" href="./meta/">meta/</a>                           # dotbot configs and profiles. No longer in use
├── <a class="DIR" href="./pre_tasks/">pre_tasks/</a>                      # Task to run before anything else in ansible-playbook
├── <a class="DIR" href="./roles/">roles/</a>                          # Ansible roles
├── <a class="DIR" href="./tasks/">tasks/</a>                          # Ansible tasks
├── <a class="DIR" href="./tools/">tools/</a>                          # dotfile configs
├── <a class="DIR" href="./vars/">vars/</a>                           # Ansible vars
├── <a class="NORM" href="./.ansible-lint">.ansible-lint</a>
├── <a class="NORM" href="./.editorconfig">.editorconfig</a>
├── <a class="NORM" href="./.gitignore">.gitignore</a>
├── <a class="NORM" href="./.gitmodules">.gitmodules</a>
├── <a class="NORM" href="./.luacheckrc">.luacheckrc</a>
├── <a class="NORM" href="./.markdownlint.json">.markdownlint.json</a>
├── <a class="NORM" href="./.stylua.toml">.stylua.toml</a>
├── <a class="NORM" href="./.yamllint">.yamllint</a>
├── <a class="NORM" href="./ansible.cfg">ansible.cfg</a>                     # Ansible configs
├── <a class="NORM" href="./dotbot-readme.md">dotbot-readme.md</a>                # Old docs for dotbot
├── <a class="NORM" href="./hosts">hosts</a>                           # Ansible hosts
├── <a class="EXEC" href="./install-profile">install-profile</a>                 # used by dotbot. No longer in use
├── <a class="EXEC" href="./install-standalone">install-standalone</a>              # used by dotbot. No longer in use
├── <a class="NORM" href="./LICENSE">LICENSE</a>
├── <a class="NORM" href="./main.yaml">main.yaml</a>                       # Main ansible playbook file
├── <a class="NORM" href="./README.md">README.md</a>
└── <a class="NORM" href="./requirements.yaml">requirements.yaml</a>               # Ansible Galaxy. needed before running Ansible
</pre>

## Inspiration

- [Restructuring dotfiles for ansible: TechDufus](https://youtu.be/hPPIScBt4Gw)
- [geerlingguy Mac Ansible setup video](https://youtu.be/1VhPVu5EK5o?si=3dpZaRqs_Ux5GK-E)
- [geerlingguy Mac Ansible setup](https://github.com/geerlingguy/mac-dev-playbook)
- [Run Ansible playbook in a script](https://github.com/frdmn/dotfiles/tree/master)
- [Run Ansible playbook in a script: TechDufus](https://github.com/TechDufus/dotfiles)
