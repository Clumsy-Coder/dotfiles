# astronvim/

AstorNvim custom configs

This folder is intended to be symlinked to `$XDG_CONFIG_HOME/astronvim/lua/user`

## dotbot config

Used by [dotfiles/meta/configs/astronvim.yaml](../../meta/configs/astronvim.yaml)

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." tools/astronvim -L 1
-->

<pre>
<a href="../../../../">dotfiles/</a>tools/vim/astronvim/
├── <a href="./README.md">README.md</a>
├── <a href="./cmp/">cmp/</a>             hrsh7th/nvim-cmp configs
├── <a href="./extras/">extras/</a>          utility files used in other places. Ex: extras/icons.lua is used in plugins/feline.lua
├── <a href="./lsp/">lsp/</a>             neovim/nvim-lspconfig configs
├── <a href="./plugins/">plugins/</a>         plugin configs and managing plugins (add, remove, disable, enable)
├── <a href="./polish.lua">polish.lua</a>       Commands to run after loading AstroNvim. Ex: Load extras/autocmds.lua
└── <a href="./updater.lua">updater.lua</a>      Configs on updating AstroNvim. https://astronvim.github.io/configuration/updater
</pre>

### cmp/

Contains configs for [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Also check [plugins/cmp.lua](./plugins/cmp.lua)

### lsp/

Contains configs for [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Language Servers are installed with [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

### plugins/

Contains plugin configs

#### init.lua

Where you manage neovim plugins.

Examples:
- https://github.com/AstroNvim/AstroNvim/blob/65c6e6c431/lua/core/plugins.lua
- https://code.mehalter.com/projects/68/files/master/plugins/init.lua
- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/init.lua
- https://github.com/hunger/AstroVim/blob/my_config/lua/core/plugins.lua

### polish.lua

This file is run last.

Good place to configuring augroups/autocommands and custom filetypes

### updater.lua

Used by AstroNvim when updating

https://astronvim.github.io/configuration/updater

## Inspired by

- https://code.mehalter.com/projects/68/files
- https://github.com/datamonsterr/astronvim_config
- https://github.com/hunger/AstroVim
- https://github.com/thieung/dotfiles
