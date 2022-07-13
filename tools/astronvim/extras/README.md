# astronvim/extras/

This folder will contain files that are used in other places

Ex: `icons.lua` contains a table of icons for different scenarios.

It's used in `plugins/cmp.git` and `plugins/feline.lua`

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." tools/astronvim/extras -L 1
-->

<pre>
<a href="../../../../../">dotfiles/</a>tools/astronvim/extras/
├── <a href="./README.md">README.md</a>
├── <a href="./autocmds.lua">autocmds.lua</a>         Neovim Autocmds. Loaded in astronvim/polish.lua
├── <a href="./filetypes.lua">filetypes.lua</a>        Load files to a filetypes. Ex: Load Brewfile as a Ruby file. Loaded in astronvim/polish.lua
└── <a href="./icons.lua">icons.lua</a>            Table of custom icons used by plugins
</pre>
