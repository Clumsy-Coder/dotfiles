# Neovim config

My Neovim config.

Inspiration:

- <https://github.com/LunarVim/Neovim-from-scratch>
- <https://github.com/ChristianChiarulli/nvim>
- <https://github.com/gmr458/nvim>

## Installing

Prerequisites: Install Neovim

1. Symbolic link `init.lua` file and `lua/config/` folder to where Neovim will look

```shell
ln -sf ~/dotfiles/tools/neovim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/tools/neovim/lua/ ~/.config/nvim
```

2. Install Neovim plugins (2 ways)

   1. Opening Neovim
      - Opening Neovim for the first time will auto install all the plugins present. Once installed, Reload Neovim to load plugins
   2. Without opening Neovim

      - Run

        ```shell
        nvim --noplugin -c 'autocmd User PackerComplete quitall'
        ```

## Files/Folder structure

### init.lua

Will be used by neovim to initialize the everything else.

NOTE: make sure this file is placed in `~/.config/nvim/init.lua`. Preferred using symbolic links.

### lua/config/general-config.lua

Neovim editor default configs

### lua/config/plugins.lua

Will be used for managing Neovim plugins. `Packer` will be managing it.

Any plugin configs are to loaded in `load-plugin-config.lua` file.

NOTE: If a plugin requires to be lazy-loaded, then make sure to load the config file for it's plugin when defining the plugin to install.
Ex:

```lua
use({
  "hrsh7th/nvim-cmp",
  config = "config.cmp"  -- config folder is located in lua/config
})
```

### lua/config/load-plugin-config.lua

Used for loading plugin configs AFTER running `lua/config/plugins.lua` file.

NOTE: this file will ONLY load plugin config IF the plugin is NOT lazy-loaded.

### lua/config/autocmd.lua

Contains Neovim settings for certain file types.

### other files in lua/config

The remaining files are plugin configs.
