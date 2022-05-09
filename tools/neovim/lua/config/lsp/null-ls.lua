-- jose-elias-alvarez/null-ls.nvim
-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/null-ls.lua

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  error("Unable to load jose-elias-alvarez/null-ls.nvim")
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
--
-- builtin formatters, diagnostics, etc
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
  debug = false,
  sources = {
    -- NOTE: make sure the diagnostics and formatters are installed and available on $PATH

    -- formatters
    formatting.prettier,                                            -- JavaScript, TypeScript, CSS
    -- formatting.black.with({ extra_args = { "--fast" } }),           -- Python
    -- formatting.stylua,                                              -- Lua
    -- formatting.markdownlint,                                        -- Markdown

    -- diagnostics
    -- diagnostics.tsc,                                                -- TypeScript
    diagnostics.shellcheck,                                         -- Sh and Bash
    diagnostics.zsh,                                                -- ZSH
    diagnostics.markdownlint,                                       -- Markdown
    diagnostics.actionlint,                                         -- YAML
    -- diagnostics.selene                                              -- Lua
  },
})
