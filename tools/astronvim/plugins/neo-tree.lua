-- Config: nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local hideFileFolder = {
  ".DS_Store",
  ".git",
  "node_modules",
}

return {
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true,                     -- when true, they will just be displayed differently than normal items
      -- hide_by_name = hideFileFolder,
      -- never_show = hideFileFolder,        -- remains hidden even if visible is toggled to true
      -- hide_by_pattern = { -- uses glob style patterns
      --   --"*.meta"
      -- },
    }
  }
}
