return {
  {
    "Clumsy-Coder/git-worktree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "User Astrofile",
    config = function()
      require("git-worktree").setup()

      local Worktree = require("git-worktree")
      local Job = require("plenary.job")

      local function is_nrdp()
        return not not (string.find(vim.loop.cwd(), vim.env.NRDP, 1, true))
      end

      Worktree.on_tree_change(function(op, path, upstream)
        if op == Worktree.Operations.Create  then
          Job:new({
            "git",
            "submodule",
            "update",
          }):start()
        end
      end)

      -- load git-worktree in telescope
      require("telescope").load_extension("git_worktree")
    end,
    -- pinning this extension because git worktree throws an error when switching worktrees
    -- a temp fix was applied on PR 106
    -- https://github.com/ThePrimeagen/git-worktree.nvim/pull/106/files
    pin = true,
  },
}
