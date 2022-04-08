-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/telescope.lua
--    https://github.com/gmr458/nvim/blob/main/lua/config/telescope.lua
--
-- for help https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt

local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  error("Unable to load nvim-telescope/telescope.nvim")
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- prompt_prefix = "   ",
    prompt_prefix = " ",           -- The character(s) that will be shown in front of Telescope's prompt.
    selection_caret = " ",         -- The character(s) that will be shown in front of the current selection.
    layout_config = {
      preview_width = 0.7,          -- width of the telescope previeew
      width = 0.9,                  -- width of the entire Telescope
      height = 0.9,                 -- height of the entire telescope
    },
    prompt_title = true,
    dynamic_preview_title = true,   -- Will change the title of the preview window dynamically
    file_ignore_patterns = {        -- A table of lua regex that define the files that should be ignored.
      ".git/",
      "node_modules/",
      "dist/",
      "build/",
      "venv/",
      "bin/",
      "obj/",
      "target/",
      ".exe",
      "__pycache__/",
      ".vscode/",
    },
    color_devicons = true,                      -- Boolean if devicons should be enabled or not.
    set_env = { ["COLORTERM"] = "truecolor" },  -- Set an environment for term_previewer. A table of key values
    path_display = { "smart" },                 -- remove as much from the path as possible to only show the difference between the displayed paths
    extensions = {
      media_files = {                           -- nvim-telescope/telescope-media-files.nvim extensions
        find_cmd = "rg",
        filetypes = { "png", "webp", "jpg", "jpeg" },
      },
    },
    -- https://github.com/nvim-telescope/telescope.nvim#telescope-setup-structure
    mappings = {    -- Your mappings to override telescope's default mappings.
      i = {         -- INSERT mode bindings
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = actions.which_key   -- Ctrl + h while telescope is open in INSERT mode
      }
    },
  },
})

-- load Telescope extensions
telescope.load_extension("fzf")           -- https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
telescope.load_extension("file_browser")  -- https://github.com/nvim-telescope/telescope-file-browser.nvim#setup-and-configuration
-- telescope.load_extension("media_files")   -- https://github.com/nvim-telescope/telescope-media-files.nvim#configuration
