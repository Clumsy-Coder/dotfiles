# astronvim/lsp/

This folder contains configs for [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." tools/astronvim/lsp -L 1
-->

### servers.lua

Contains a list of Language server to download and use

This Language servers are installed using [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

Check:
- https://astronvim.github.io/recipes/advanced_lsp
- https://github.com/williamboman/nvim-lsp-installer#available-lsps
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Example:
- https://code.mehalter.com/projects/68/files/master/lsp/servers.lua
- https://github.com/datamonsterr/astronvim_config/blob/main/lsp/servers.lua
