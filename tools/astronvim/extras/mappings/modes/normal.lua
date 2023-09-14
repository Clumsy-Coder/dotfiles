-- Which key keymaps
-- mode: NORMAL
--
-- inspired by:
--    https://github.com/thieung/dotfiles/blob/main/config/nvim/which-key/mode/n.lua

return {
  -- git-conflict.nvim
  -- ["C"] = {
  --   name = "git-conflict",
  --   ["c"] = { "<Plug>(git-conflict-ours)", "Take Current" },
  --   ["i"] = { "<Plug>(git-conflict-theirs)", "Take Incoming" },
  --   ["b"] = { "<Plug>(git-conflict-both)", "Take Both" },
  --   ["0"] = { "<Plug>(git-conflict-none)", "Take None" },
  --   ["r"] = { "<cmd>GitConflictRefresh<cr>", "Refresh Conflicts" },
  --   ["l"] = { "<cmd>GitConflictListQf<cr>", "List Conflicts" },
  --   ["]"] = { "<Plug>(git-conflict-next-conflict)",  "Next conflict" },
  --   ["["] = { "<Plug>(git-conflict-prev-conflict)",  "Previous conflict" },
  -- },
  -- ############################################################################################ --
  -- ############################################################################################ --
  -- ############################################################################################ --
  ["<leader>"] = {
    -- ########################################################################################## --
    -- neogen
    -- using neogen to generate annotations(code documentation)
    a = {
        name = "󰏫 Annotate",
        ["<cr>"] = { function() require("neogen").generate() end, "Current" },
        c = { function() require("neogen").generate({ type = "class" }) end, "Class"    },
        f = { function() require("neogen").generate({ type = "func"  }) end, "Function" },
        t = { function() require("neogen").generate({ type = "type"  }) end, "Type"     },
        F = { function() require("neogen").generate({ type = "file"  }) end, "File"     },
    },
    -- ########################################################################################## --
    -- markdown
    m = {
      name = " Markdown",
      p = { "<cmd>Glow<cr>", "Preview Markdown (using glow)" },
      r = { "<cmd>MarkdownPreview<cr>", "Render Markdown in browser"},
      s = { "<cmd>MarkdownPreviewStop<cr>", "Stop rendering Markdown in browser"},
      t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle rendering Markdown in browser"},
    },
    -- ########################################################################################## --
    -- telescope
    f = {
      e = { "<cmd>Telescope file_browser<cr>", "File explorer" },
      t = { "<cmd>TodoTelescope<cr>", "Find all TODOs"}
    },
    -- ########################################################################################## --
    -- git
    g = {
      w = {
        name = "worktrees",
        a = { function() require('telescope').extensions.git_worktree.create_git_worktree() end, "Add worktree", silent = true},
        s = { function() require('telescope').extensions.git_worktree.git_worktrees() end, "Switch worktree"},
        -- r = { function() require("git-worktree").delete_worktree() end, "Remove worktree"},
      }
    }
  }
  -- ############################################################################################ --
  -- ############################################################################################ --
  -- ############################################################################################ --
}
