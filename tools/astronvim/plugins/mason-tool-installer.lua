-- Config: mason-tool-installer
-- WhoIsSethDaniel/mason-tool-installer.nvim
--
-- obtained from
--    https://code.mehalter.com/projects/68/files/master/plugins/mason-tool-installer.lua

return {
  auto_update = false, -- autoupdating will slow down Neovim startup
  start_delay = 5000, -- set delay (in ms) before the installation starts.
  ensure_installed = {
    "actionlint",       -- Github actions linter
    "codespell",        -- spell check
    "eslint_d",         -- eslint but faster
    "gitlint",          -- git commit message linter
    "hadolint",         -- dockerfile linter
    "luacheck",         -- lua linter
    "markdownlint",     -- markdown linter
    "misspell",         -- check commonly misspelled words
    "prettierd",        -- prettier but faster
    "shellcheck",       -- shell linter
    "stylua",           -- lua code formatter
    "vint",             -- vimscript linter
    "yamllint"          -- YAML linter
  },
}
