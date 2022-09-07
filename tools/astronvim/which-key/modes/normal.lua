-- Which key keymaps
-- mode: NORMAL
--
-- inspired by:
--    https://github.com/thieung/dotfiles/blob/main/config/nvim/which-key/mode/n.lua

return {
  ["C"] = {
    name = "git-conflict",
    ["c"] = { "<Plug>(git-conflict-ours)", "Take Current" },
    ["i"] = { "<Plug>(git-conflict-theirs)", "Take Incoming" },
    ["b"] = { "<Plug>(git-conflict-both)", "Take Both" },
    ["0"] = { "<Plug>(git-conflict-none)", "Take None" },
    ["r"] = { "<cmd>GitConflictRefresh<cr>", "Refresh Conflicts" },
    ["l"] = { "<cmd>GitConflictListQf<cr>", "List Conflicts" },
    ["]"] = { "<Plug>(git-conflict-next-conflict)",  "Next conflict" },
    ["["] = { "<Plug>(git-conflict-prev-conflict)",  "Previous conflict" },
  },
  ["<leader>"] = {
    s = {
      t = { "<cmd>TodoTelescope<cr>", "Search all TODOs"}
    },
  }
}
