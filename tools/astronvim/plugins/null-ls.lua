-- jose-elias-alvarez/null-ls.nvim
-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/null-ls.lua
--    https://github.com/datamonsterr/astronvim_config/blob/main/plugins/null-ls.lua
--    https://code.mehalter.com/projects/68/files/master/plugins/null-ls.lua
-- Null-ls builtins
--    https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
--    https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
--    https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

return {
  sources = {
    -- code actions
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
    code_actions.eslint_d,            -- eslint code suggestions
    code_actions.gitsigns,            -- git action on a hunk
    code_actions.shellcheck,          -- shellcheck code suggestions

    -- completion
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#completion
    -- completion.luasnip, -- snippet engine for Neovim
    completion.spell,                 -- spell suggestions

    --diagnostics
    --https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
    diagnostics.actionlint,           -- Github actions
    diagnostics.codespell,            -- spell check
    -- diagnostics.commitlint,          -- checks commit messages meets conventional commit format
    -- diagnostics.cspell,              -- spell checker for code
    -- diagnostics.editorconfig_checker, -- check files are using .editorconfig configs
    diagnostics.eslint_d,             -- like eslint but faster
    diagnostics.gitlint,              -- lint for git commit messages
    diagnostics.hadolint,             -- dockerfile linter
    diagnostics.jsonlint,             -- json linter
    diagnostics.luacheck,             -- lua linter
    diagnostics.markdownlint,         -- markdown linter
    diagnostics.misspell,             -- checks commonly misspelled words in code
    -- diagnostics.selene,
    diagnostics.shellcheck,           -- shell linter
    -- diagnostics.spectral,            -- json/yaml linter
    -- diagnostics.todo_comments,         -- show TODO comments
    -- diagnostics.trail_space,           -- detect trailing whitespace
    diagnostics.tsc,                  -- typescript linter
    diagnostics.vint,                 -- vimscript linter
    -- diagnostics.yamllint,            -- yaml linter
    diagnostics.zsh,                  -- zsh linter

    -- formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
    -- formatting.beautysh,               -- shell code formatter
    formatting.codespell,             -- fix common spelling mistakes
    formatting.eslint_d,              -- eslint formatter
    formatting.markdownlint,          -- markdown formatter
    -- formatting.markdown_toc,           -- markdown table of content generator
    -- formatting.nginx_beautifier,       -- nginx formatter
    formatting.prettierd,             -- js, ts, jsx, tsx, css
    -- formatting.shfmt,                  -- bash
    formatting.stylua,                -- lua

    -- hover
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#hover
    hover.dictionary,                 -- dictionary
  },

  -- Auto format when saving
  -- on_attach = function(client)
  --  if client.server_capabilities.documentFormattingProvider then
  --    vim.api.nvim_create_augroup("format_on_save", { clear = true })
  --    vim.api.nvim_create_autocmd("BufWritePre", {
  --      desc = "Auto format before save",
  --      group = "format_on_save",
  --      pattern = "<buffer>",
  --      callback = function()
  --        vim.lsp.buf.formatting_sync({ async = true })
  --      end,
  --    })
  --  end
  -- end,
}
