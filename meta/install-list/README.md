# meta/install-list

Files that contains plugin, extensions, etc to be installed using configs from `dotfiles/meta/configs/`

Example:

- `dotfiles/meta/configs/apt.yaml` uses `dotfiles/meta/install-list/apt` to install apt packages

- `dotfiles/meta/configs/nvm.yaml` uses `dotfiles/meta/install-list/npm` to install npm packages

- `dotfiles/meta/configs/homebrew.yaml` uses `dotfiles/meta/install-list/Brewfile` to setup and install homebrew packages

---

## File/Directory structure

<!--
Quick tip: to generate tree structure with URL, run the following command
tree meta/install-list -H "."
-->

<pre>
<a href="../../../../">dotfiles/</a>meta/install-list/
├── <a href="./Brewfile">Brewfile</a>
├── <a href="./README.md">README.md</a>
├── <a href="./apt">apt</a>
├── <a href="./apt-gui">apt-gui</a>
├── <a href="./cargo">cargo</a>
├── <a href="./dnf">dnf</a>
├── <a href="./dnf-copr">dnf-copr</a>
├── <a href="./dnf-gui">dnf-gui</a>
├── <a href="./go">go</a>
├── <a href="./npm">npm</a>
└── <a href="./vscode">vscode</a>
</pre>

---
