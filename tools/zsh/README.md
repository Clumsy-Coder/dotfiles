# zsh/

ZSH config

## dotbot config

Used by [dotfiles/meta/configs/zsh.yaml](https://github.com/Clumsy-Coder/dotfiles/blob/master/meta/configs/zsh.yaml)

## File/Directory structure

<pre>
<a href="../../../../">dotfiles/</a>tools/zsh/
├── <a href="./.zshenv">.zshenv</a>
├── <a href="./.zshrc">.zshrc</a>
├── <a href="./README.md">README.md</a>
├── <a href="./aliases.zsh">aliases.zsh</a>
├── <a href="./antigen.zsh">antigen.zsh</a>
├── <a href="./checks.zsh">checks.zsh</a>
├── <a href="./exports.zsh">exports.zsh</a>
├── <a href="./powerlevel9k.zsh">powerlevel9k.zsh</a>
└── <a href="./setopt.zsh">setopt.zsh</a>

</pre>

### .zshrc

Main zsh source file.

### .zshenv

Load zsh ENV variables

Also sets XDG env variables. These variables are used by software to store their data.

Check https://wiki.archlinux.org/title/XDG_Base_Directory

### aliases.zsh

Load zsh aliases

### antigen.zsh

Load zsh oh-my-zsh plugins

### checks.zsh

Load zsh checks. What OS, is npm, homebrew, etc installed

### exports.zsh

Load zsh PATHS

### powerlevel9k.zsh

Load zsh oh-my-zsh theme configs

### setopt.zsh

Load zsh settings
