-- all neovim plugins to load

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
  error('unable to load packer. Check lua/config/plugins.lua')
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
  use("wbthomason/packer.nvim")        -- package manager
  use("nvim-lua/popup.nvim")           -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim")         -- Useful lua functions used by lots of plugins
  use("b0o/SchemaStore.nvim")          -- json collection of keywords for each dev files. Ex: package.json and docker-compose.yml
  use("kyazdani42/nvim-web-devicons")  -- dev icons

  -- file explorer
  -- NORMAL mode: Ctrl + n
  use({
    'kyazdani42/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('config.nvim-tree')",
  })

  -- commenting lines of code
  -- NORMAL mode: gcc
  -- VISUAL mode: gc
  use({
    'numToStr/Comment.nvim',
    config = "require('config.comment')",
  })

  -- git decorations
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = "require('config.gitsigns')",
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- manage vim buffers as tabs
  use({
    "akinsho/bufferline.nvim",
    event = "BufWinEnter",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('config.bufferline')",
  })

  -- manage terminal in neovim
  -- toggle terminal with Ctrl + \
  use({
    "akinsho/toggleterm.nvim",
    -- cmd = "ToggleTerm",
    config = "require('config.toggleterm')",
  })

  -- Autopairs, integrates with both cmp and treesitter
  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = "require('config.autopairs')",
    requires = 'hrsh7th/nvim-cmp'
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    -- event = "BufWinEnter",
    config = "require('config.treesitter')",
  })
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })  -- Treesitter Rainbow parenthesis
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })      -- context aware commenting. Works with numToStr/Comment.nvim

  -- blankline indents
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('config.indent-blankline')",
  })

  -- highlight CSS colours. Ex: #fff
  use({
    "norcalli/nvim-colorizer.lua",
    -- ft = { "css", "html", "javascript", "json", "jsonc", "lua", "yaml" },
    config = "require('config.colorizer')",
  })

  -- highly extendable fuzzy finder over lists
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = "require('config.telescope')",
    requires = 'nvim-lua/plenary.nvim'
  })
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  -- use("nvim-telescope/telescope-media-files.nvim")

  -- cmp code completion
  use({
    "hrsh7th/nvim-cmp",
    config = "require('config.cmp')" })
  use({ "hrsh7th/cmp-buffer" })         -- buffer completions
  use({ "hrsh7th/cmp-path" })           -- path completions
  use({ "hrsh7th/cmp-cmdline", })       -- cmdline completions
  use({ "saadparwaiz1/cmp_luasnip", })  -- snippet completions connecter for L3MON4D3/LuaSnip
  use({ "hrsh7th/cmp-nvim-lsp", })      -- nvim LSP connector. connects neovim/nvim-lspconfig to hrsh7th/nvim-cmp
  use({ "hrsh7th/cmp-nvim-lua", })      -- completion for nvim Lua API
  -- use({ "ray-x/cmp-treesitter",     after = "nvim-cmp"}),      -- Using all treesitter highlight nodes as completion candidates
  -- use({ "andersevenrud/cmp-tmux",   after = "nvim-cmp"}),      -- Tmux completion source for nvim-cmp
  use({
    "petertriho/cmp-git",
    requires = "nvim-lua/plenary.nvim",
    config = "require('config.cmp-git')"
  })

  -- LSP
  use({ "williamboman/nvim-lsp-installer", })   -- simple to use language server installer
  use({
    "neovim/nvim-lspconfig",                    -- enable LSP
    config = "require('config.lsp')" })
  use("jose-elias-alvarez/null-ls.nvim")        -- for formatters and linters

  -- display keybindings
  -- use "folke/which-key.nvim"

  -- snippets
  use("L3MON4D3/LuaSnip")                   -- snippet engine
  use("rafamadriz/friendly-snippets")       -- extra snippets for different languages

  -- colourschemes
  -- NOTE: if loading nvim and installing packer for the first time, it will throw an error,
  -- due to not being able to load gruvbox.nvim plugin.
  -- A better option is to install plugins without opening nvim.
  -- run command:
  --    nvim --headless --noplugin -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
  use ({
    "ellisonleao/gruvbox.nvim",
    config = "require('config.theme')"
  })

  -- vim status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('config.lualine')"
  })

  -- scrollbar
  use({
    "petertriho/nvim-scrollbar",
    config = function() require("scrollbar").setup() end
  })

  -- Automatically set up the configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
