-- Config: mason-null-ls
-- jayp0521/mason-null-ls.nvim
--
-- obtained from
--    https://code.mehalter.com/projects/68/files/master/plugins/mason-null-ls.lua

return {
  auto_update = false, -- autoupdating will slow down Neovim startup
  start_delay = 5000,  -- set delay (in ms) before the installation starts.
  ensure_installed = {
    "actionlint",      -- LINTER:            Github actions linter
    "ansible-lint",    -- LINTER:            ansible
    "beautysh",        -- FORMATTER:         zsh
    "codespell",       -- LINTER:            spell check
    "eslint_d",        -- LINTER:            eslint but faster
    "gitlint",         -- LINTER:            git commit message linter
    "hadolint",        -- LINTER:            dockerfile linter
    "luacheck",        -- LINTER:            lua linter
    "markdownlint",    -- LINTER, FORMATTER: markdown linter
    "misspell",        -- LINTER:            check commonly misspelled words
    "prettierd",       -- FORMATTER:         prettier but faster
    "shellcheck",      -- LINTER:            shell linter
    "stylua",          -- FORMATTER:         lua code formatter
    "vint",            -- LINTER:            vimscript linter
    "yamllint",        -- LINTER:            YAML linter
  },
}
