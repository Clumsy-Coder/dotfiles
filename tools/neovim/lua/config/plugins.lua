-- Packer - neovim plugin manager
-- Commonly used commands - https://github.com/wbthomason/packer.nvim#quickstart
-- PackerStatus
--    Show status installed plugins
-- PackerClean
--    Remove any disabled or unused plugins
-- PackerInstall
--    Clean, then install missing plugins
-- PackerUpdate
--    Clean, then update and install plugins
-- PackerSync
--    Install plugins and compile (runs PackerUpdate and PackerCompile)
-- PackerLoad [plugin]
--    Loads opt plugin immediately
--
-- Specifying plugin installations
--  Ex: install certain plugins, or loading certain plugins
--  https://github.com/wbthomason/packer.nvim#specifying-plugins
-- Dependencies: when using "requires" it will install those plugins before downloading the current one.
--  https://github.com/wbthomason/packer.nvim#dependencies
-- Sequencing: specifying the loading order with "after". It will load that plugin before
-- loading the current. Can be important regarding plugin load order. Ex: CMP and LSP
--  https://github.com/wbthomason/packer.nvim#sequencing
--
--
--  WARNING: IF you're going to lazy load a plugin, make sure the config is loaded when defining
--           the plugin to install, NOT loading the config file in config.load-plugin-config .
--           Loading config file in config.load-plugin-config for plugin that's lazy loaded will
--           cause an error, due to not being able to find the said plugin.
--           If you're going to lazyload, than load the plugin config in config.load-plugin-config.


local fn = vim.fn

-- Automatically install packer
-- packer plugin manager installed in   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- plugins will be installed in         ~/.local/share/nvim/site/pack/packer/
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  error("unable to load packer. Check lua/config/plugins.lua")
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})

return packer.startup(function(use)

  -- REQUIRED PLUGINS -------------------------------------------------------------------------- {{{
  -- //////////////////////////////////////////////////////////////////////////////////////////// --
  -- plugins that are required by other plugins

  use "wbthomason/packer.nvim"        -- package manager
  use "nvim-lua/popup.nvim"           -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"         -- Useful lua functions used by lots of plugins
  use "b0o/SchemaStore.nvim"          -- json collection of keywords for each dev files. Ex: package.json and docker-compose.yml
  use "kyazdani42/nvim-web-devicons"  -- dev icons

  -- }}}

  -- FUNCTIONAL PLUGINS ------------------------------------------------------------------------ {{{
  -- //////////////////////////////////////////////////////////////////////////////////////////// --

  -- highly extendable fuzzy finder over lists
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-file-browser.nvim"
  -- use("nvim-telescope/telescope-media-files.nvim")

  -- cmp code completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"          -- buffer completions
  use "hrsh7th/cmp-path"            -- path completions
  use "hrsh7th/cmp-cmdline"         -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"    -- snippet completions connecter for L3MON4D3/LuaSnip
  use "hrsh7th/cmp-nvim-lsp"        -- nvim LSP connector. connects neovim/nvim-lspconfig to hrsh7th/nvim-cmp
  use "hrsh7th/cmp-nvim-lua"        -- completion for nvim Lua API
  -- use { "ray-x/cmp-treesitter",     after = "nvim-cmp"},      -- Using all treesitter highlight nodes as completion candidates
  -- use { "andersevenrud/cmp-tmux",   after = "nvim-cmp"},      -- Tmux completion source for nvim-cmp
  use "petertriho/cmp-git"

  -- LSP
  use "williamboman/nvim-lsp-installer"   -- simple to use language server installer
  use "neovim/nvim-lspconfig"             -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim"   -- for formatters and linters

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "p00f/nvim-ts-rainbow"                             -- Treesitter Rainbow parenthesis
  use "JoosepAlviste/nvim-ts-context-commentstring"      -- context aware commenting. Works with numToStr/Comment.nvim

  -- snippets
  use "L3MON4D3/LuaSnip"                    -- snippet engine
  use "rafamadriz/friendly-snippets"        -- extra snippets for different languages

  use "lewis6991/impatient.nvim"                            -- improve startup time
  use "folke/which-key.nvim"                                -- display keybindings
  use "akinsho/toggleterm.nvim"                             -- manage terminal in neovim. toggle terminal with Ctrl + \
  use "akinsho/bufferline.nvim"                             -- manage vim buffers as tabs
  use "moll/vim-bbye"                                       -- closing buffers without exiting neovim
  use "kyazdani42/nvim-tree.lua"                            -- file explorer
  use "simrat39/symbols-outline.nvim"                       -- A tree like view for symbols using LSP. :SymbolsOutline
  use "lewis6991/gitsigns.nvim"                             -- git decorations
  use "numToStr/Comment.nvim"                               -- commenting lines of code
  use "windwp/nvim-autopairs"                               -- Autopairs, integrates with both cmp and treesitter
  use "goolord/alpha-nvim"                                  -- welcome screen dashboard
  use "ahmedkhalf/project.nvim"                             -- manage projects

  -- pretty diagnostics, references, quickfixes and location list
  -- use{
  --   "folke/trouble.nvim",
  --   config = function() require("trouble").setup() end
  -- }

  -- }}}

  -- VISUAL PLUGINS ---------------------------------------------------------------------------- {{{
  -- //////////////////////////////////////////////////////////////////////////////////////////// --

  -- colourschemes
  -- NOTE: if loading nvim and installing packer for the first time, it will throw an error,
  -- due to not being able to load gruvbox.nvim plugin.
  -- A better option is to install plugins without opening nvim.
  -- run command:
  --    nvim --headless --noplugin -c "autocmd User PackerComplete quitall" -c "PackerInstall"
  use "ellisonleao/gruvbox.nvim"
  use "lukas-reineke/indent-blankline.nvim"                         -- blankline indents
  use "norcalli/nvim-colorizer.lua"                                 -- highlight CSS colours. Ex: #fff
  use "nvim-lualine/lualine.nvim"                                   -- vim status line

  -- scrollbar
  use {
    "petertriho/nvim-scrollbar",
    config = function() require("scrollbar").setup() end
  }

  -- }}}

  -- //////////////////////////////////////////////////////////////////////////////////////////// --

  -- Automatically set up the configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
