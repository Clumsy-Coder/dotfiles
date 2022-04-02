-- config obtained from https://github.com/gmr458/nvim/blob/main/lua/config/nvim-tree.lua

vim.g.nvim_tree_indent_markers = 1          -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_group_empty = 1             -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_highlight_opened_files = 1  -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_add_trailing = 1            -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_special_files = {}          -- List of filenames that gets highlighted with NvimTreeSpecialFile. Ex: { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "!",
    staged = "+",
    unmerged = "",
    renamed = "➜",
    untracked = "?",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  error("Unable to load kyazdani42/nvim-tree")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  error("Unable to load kyazdani42/nvim-tree.config")
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  disable_netrw = true,
  auto_close = true,
  auto_reload_on_write = true,
  hijack_cursor = true,
  hijack_netrw = true,
  open_on_setup = false,
  open_on_tab = false,
  filters = {
    custom = { ".git", "node_modules" },
  },
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "s", cb = tree_cb("vsplit") },
        { key = "z", cb = tree_cb("") },
        { key = "m", cb = tree_cb("") },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = { "notify", "packer", "qf", "TelescopePrompt" },
          buftype = { "terminal" },
        },
      },
    },
  },
})
