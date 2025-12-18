return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      {
        -- obtained from https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/treesitter.lua?position=source-5.1-5.95-1
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_deferred = 1
        end,
      },
      {
        -- obtained from https://code.mehalter.com/AstroNvim_user/~files/91d8255ef1d901067621420b0e90e92f4ba8b0ee/plugins/treesitter.lua?position=source-6.1-19.7-1
        "HiPhish/rainbow-delimiters.nvim",
        opts = function()
          return {
            strategy = {
              [""] = function()
                -- load if the buffer is NOT large
                if not vim.b.large_buf then
                  return require("rainbow-delimiters").strategy.global
                end
              end,
            },
          }
        end,
        config = function(_, opts)
          require("rainbow-delimiters.setup")(opts)
        end,
      },
    },
    opts = function(_, opts)
      local config = require("user.plugins.treesitter.config")
      return require("astronvim.utils").extend_tbl(opts, config)
    end,
  },
}
