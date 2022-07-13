# astronvim/plugins/

AstorNvim custom plugin configs

This folder contains configs for Nvim plugins

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." tools/astronvim/plugins -L 1
-->

<!-- <pre>
<a href="../../../../../">dotfiles/</a>tools/astronvim/plugins/
├── <a href="./README.md">README.md</a>
├── <a href="./init.lua">init.lua</a>                   Manage Neovim plugins
├── <a href="./cmp-git.lua">cmp-git.lua</a>
├── <a href="./cmp.lua">cmp.lua</a>
├── <a href="./feline.lua">feline.lua</a>
├── <a href="./indent_blankline.lua">indent_blankline.lua</a>
├── <a href="./neo-tree.lua">neo-tree.lua</a>
├── <a href="./nvim-lsp-installer.lua">nvim-lsp-installer.lua</a>
└── <a href="./treesitter.lua">treesitter.lua</a>
</pre> -->

### init.lua

This is where you manage Neovim plugins (add, disable and enable plugins)

For more details: read https://astronvim.github.io/configuration/splitting_up

Default plugin configs https://astronvim.github.io/configuration/plugin_defaults

Check for examples
- https://code.mehalter.com/projects/68/files/master/plugins/init.lua
- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/init.lua

#### Loading configs for added plugins

When you're adding a new plugin and it has it's own configs, place the configs in this folder ( `dotfiles/tools/astronvim/plugins/` )

Load the plugin configs in the `init.lua`

Ex:

In `dotfiles/astronvim/plugins/init.lua`

```lua
return {
  [ "petertriho/cmp-git" ]    = {           -- git commit, pull request completion
    after = "nvim-cmp",
    ft = "gitcommit",
    config = function()
      astronvim.add_user_cmp_source("git")
      require("user.plugins.cmp-git")
    end
  },
}
```

This will load `dotfiles/astronvim/plugins/cmp-git.lua` when running `cmp-git` plugin
