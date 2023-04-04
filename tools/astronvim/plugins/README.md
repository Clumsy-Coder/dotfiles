# astronvim/plugins/

AstorNvim custom plugin configs

This folder contains configs for Nvim plugins

## File/Directory structure

<!--
loaded tree structure with
tree -a -H "." tools/astronvim/plugins -L 1
-->

<pre>
<a href="../../../../../">dotfiles/</a>tools/astronvim/plugins/
├── <a href="./README.md">README.md</a>
├── <a href="./cinnamon/">cinnamon/</a>
├── <a href="./cmp/">cmp/</a>
├── <a href="./dap/">dap/</a>
├── <a href="./diffview/">diffview/</a>
├── <a href="./feline/">feline/</a>
├── <a href="./flatten/">flatten/</a>
├── <a href="./git-conflict/">git-conflict/</a>
├── <a href="./gitsigns/">gitsigns/</a>
├── <a href="./glow/">glow/</a>
├── <a href="./heirline/">heirline/</a>
├── <a href="./indent-blankline/">indent-blankline/</a>
├── <a href="./lsp/">lsp/</a>
├── <a href="./markdown-preview/">markdown-preview/</a>
├── <a href="./mason/">mason/</a>
├── <a href="./mini/">mini/</a>
├── <a href="./neo-tree/">neo-tree/</a>
├── <a href="./neogen/">neogen/</a>
├── <a href="./nightfox/">nightfox/</a>
├── <a href="./noice/">noice/</a>
├── <a href="./notify/">notify/</a>
├── <a href="./null-ls/">null-ls/</a>
├── <a href="./session-manager/">session-manager/</a>
├── <a href="./telescope/">telescope/</a>
├── <a href="./todo-comments/">todo-comments/</a>
├── <a href="./treesitter/">treesitter/</a>
└── <a href="./wakatime/">wakatime/</a>

</pre>

## Loading configs for added plugins

The plugins are loaded using [`Lazy.nvim`](https://github.com/folke/lazy.nvim)

You can load a plugin in two ways,

1. putting all plugins config in one file,
2. putting single plugin config in a single file

### loading plugins from one file

add plugin configs in one file named `init.lua`

#### `./init.lua`

```lua
return {
  {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    opts = {
      window = {
        open = "vsplit",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local config = require("user.plugins.neo-tree.config")
      return require("astronvim.utils").extend_tbl(opts, config)  -- extend astronvim neo-tree config with your own
    end
  },
}
```

This will install and load `flatten.nvim` and `neo-tree.nvim`.

`neo-tree.nvim` was already been installed by default Astronvim v3 config,
so this will extend your config with Astronvim v3 default config.

Check for examples

- https://code.mehalter.com/AstroNvim_user/~files/80c7c0f743b4dd0f105f26d7b8ab0d55c3ebc8e0/plugins/core.lua

### loading plugin in multiple files

Each plugin can be loaded from multiple files.

It can be placed as

```
dotfiles/tools/astronvim/plugins/
├── flatten.lua
└── neo-tree.lua
```

or it can be placed in multiple file/folders

```
dotfiles/tools/astronvim/plugins/
├── flatten/
│   └── init.lua
└── neo-tree/
    ├── config.lua
    └── init.lua
```

#### `./flatten.lua` or `./flatten/init.lua`

```lua
return {
  "willothy/flatten.nvim",
  lazy = false,
  priority = 1001,
  opts = {
    window = {
      open = "vsplit",
    },
  },
}
```

#### `./neo-tree.lua` or `./neo-tree/init.lua`

```lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.neo-tree.config")
    return require("astronvim.utils").extend_tbl(opts, config)  -- extend astronvim neo-tree config with your own
  end
}
```

This will install and load `flatten.nvim` and `neo-tree.nvim`.

`neo-tree.nvim` was already been installed by default Astronvim v3 config,
so this will extend your config with Astronvim v3 default config.
