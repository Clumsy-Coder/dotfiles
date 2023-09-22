# :warning: `Dotbot` is no longer being used. Replaced with ansible. check [README.md](../README.md) :warning:

# dotfiles/meta/

Where all dotbot configs will be placed.

## How does it work?

This folder is used by [dotbot](https://github.com/anishathalye/dotbot), a dotfiles bootstrapping tool used for setting up configs.

This folder is setup using [ecarlson94/dotbot-template](https://github.com/ecarlson94/dotbot-template) file/folder structure.

Read: [anishathalye/dotbot using different groups of task](https://github.com/anishathalye/dotbot/wiki/Tips-and-Tricks#how-can-i-have-different-groups-of-tasks-for-different-hosts-with-different-configurations)

`dotfiles/install-standalone` script is used for running dotbot config located in `dotfiles/meta/configs/` folder.

`dotfiles/install-profile` script is used for running a collection of dotbot configs defined in `dotfiles/meta/profiles/` folder.

---

## File/Folder structure

<pre>
<a href="../../../">dotfiles/</a>meta/
├── <a href="./README.md">README.md</a>
├── <a href="./base.yaml">base.yaml</a>
├── <a href="./configs/">configs/</a>
├── <a href="https://github.com/anishathalye/dotbot">dotbot/</a>
├── <a href="./install-list/">install-list/</a>
├── <a href="./install-script/">install-script/</a>
└── <a href="./profiles/">profiles/</a>
</pre>

### base.yaml

default dotbot config to run when running a config from `dotfiles/config/`

**DO NOT** remove.

Obtained from: [ecarlson94/dotbot-template : base.yaml](https://github.com/ecarlson94/dotbot-template/blob/main/meta/base.yaml)

### configs/

contains all dotbot configs/

Check [configs/](./configs)

### dotbot/

[Dotbot repo](https://github.com/anishathalye/dotbot) used as submodule. The software used for bootstrapping and running dotbot configs

### install-list/

Files that contains plugin, extensions, etc to be installed using configs from `dotfiles/meta/configs/`

Check [install-list/](./install-list)

### install-script/

Scripts that are run from a config file in `dotfiles/meta/configs/` folder.

Check [install-script/](./install-script)

### profiles/

contains all dotbot profile script

Check [profiles/](./profiles)

---
