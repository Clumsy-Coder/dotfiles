-- kyazdani42/nvim-tree.lua
-- config obtained from https://github.com/gmr458/nvim/blob/main/lua/config/nvim-tree.lua

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
-- default will show icon by default if no icon is provided
-- default shows no icon by default
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

local diagnosticIcons = {
  hint = "",
  info = "",
  warning = "",
  error = "",
}

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  auto_reload_on_write = true,                  -- reloads the explorer every time a buffer is written to
  disable_netrw = true,                         -- disable netrw (nvim builtin file explorer)
  hide_root_folder = true,                      -- hide the path of the current working directory on top of the tree
  hijack_cursor = true,                         -- keeps the cursor on the first letter of the filename when moving in the tree
  hijack_netrw = true,                          -- hijack netrw windows (overridden if |disable_netrw| is `true`)
  -- hijack_unnamed_buffer_when_opening = false,   -- pens in place of the unnamed buffer if it's empty.
  -- ignore_buffer_on_setup = false,               -- will ignore the buffer, when deciding to open the tree on setup
  open_on_setup = false,                        -- will automatically open the tree when running setup if
                                                -- startup buffer is a directory, is empty or is unnamed. nvim-tree window will
                                                -- be focused.
  open_on_setup_file = false,                   -- will automatically open the tree when running setup if startup buffer is a file. File window will be focused. File will be found if |update_focused_file.enable| is set.
  open_on_tab = false,                          -- opens the tree automatically when switching tabpage or opening a new tabpage if the tree was previously open.
  -- auto_close = true,                            -- @deprecated auto close nvim-tree when quitting neovim
  sort_by = "name",                          -- changes how files within the same directory are sorted
  update_cwd = true,                            -- changes the tree root directory on `DirChanged` and refreshes the tree.
  view = {
    mappings = {
      list = {                                  -- a list of keymaps that will extend or override the default keymaps
        { key = "s", cb = tree_cb("vsplit") },
        { key = "z", cb = tree_cb("") },
        { key = "m", cb = tree_cb("") },
      },
    },
  },
  hijack_directories = {                        -- hijacks new directory buffers when they are opened (`:e dir`).
    enable = true,
    auto_open = true,                           -- opens the tree if the tree was previously closed.
  },
  update_focused_file = {                       -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    enable = false,
    update_cwd = false,                         -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory.
    ignore_list = {},
  },
  ignore_ft_on_setup = {                        -- list of filetypes that will make |open_on_setup| not open.
    "startify",
    "dashboard",
    "alpha",
  },
  system_open = {                               -- configuration options for the system open command
    cmd = nil,                                  -- the command to run, leaving nil should work but useful if you want to override the default command with another one.
    args = {},                                  -- the command arguments as a list
  },
  diagnostics = {                               -- show lsp diagnostics in the signcolumn
    enable = true,
    show_on_dirs = false,                       -- if the node with diagnostic is not visible, then show diagnostic in the parent directory
    icons = diagnosticIcons                     -- icons for diagnostic severity
  },
  filters = {                                   -- filter options
    dotfiles = false,                        -- do not show `dotfiles` (files starting with a `.`)
    -- exclude = {},                            -- list of directories or files to exclude from filtering
    custom = {                                  -- custom list of vim regex for file/directory names that will not be shown. Backslashes must be escaped e.g. "^\\.git". See |string-match|.
      ".git",
      "node_modules"
    },
  },
  git = {                                       -- integration with icons and colors
    enable = true,
    ignore = true,                              -- ignore files based on `.gitignore`
    timeout = 400,                              -- kills the git process after some time if it takes too long
  },
  actions = {
    open_file = {
      quit_on_open = true,                     -- closes the explorer when opening a file. It will also disable preventing a buffer overriding the tree.
      -- resize_window = false,                    -- resizes the tree when opening a file
      window_picker = {                         -- window picker configuration
        exclude = {
          -- enable = true,                        -- Enable the feature. If the feature is not enabled, files will open in window from which you last opened the tree.
          -- chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",  -- A string of chars used as identifiers by the window picker.

          -- able of buffer option names mapped to a list of option values that indicates
          -- to the picker that the buffer's window should not be selectable.
          filetype = {
            "notify",
            "packer",
            "qf",
            "TelescopePrompt"
          },
          buftype = { "terminal" },
        },
      },
    },
  },
  trash = {                                     -- configuration options for trashing
    cmd = "trash",                              -- the command used to trash items (must be installed on your system)
    require_confirm = true,                     -- show a prompt before trashing takes place.
  },
  log = {                                       -- configuration for diagnostic logging
    enable = false,                             -- enable logging to a file `$XDG_CACHE_HOME/nvim/nvim-tree.log`
    truncate = false,                           -- remove existing log file at startup
    types = {                                   -- specify which information to log
      all = false,                              -- everything
      config = false,                           -- options and mappings, at startup
      copy_paste = false,                       -- file copy and paste actions
      git = false,                              -- git processing
      profile = false,                          -- timing of some operations
    },
  },
})

-- autoclose nvim-tree. applies when not focused on nvim-tree.
-- may interfere with other plugins
-- https://github.com/kyazdani42/nvim-tree.lua#tips--reminders
vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]