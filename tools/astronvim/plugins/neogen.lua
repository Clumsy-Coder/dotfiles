-- Config: neogen
-- repo: github.com/danymat/neogen
-- description: adding annotations (documentation) on code
--
-- obtained from
--   https://code.mehalter.com/projects/68/files/master/plugins/neogen/config.lua

return {
  snippet_engine = "luasnip",
  languages = {
    javascript = { template = { annotation_convention = "jsdoc" } },
    javascriptreact = { template = { annotation_convention = "jsdoc" } },
    lua = { template = { annotation_convention = "ldoc" } },
    python = { template = { annotation_convention = "google_docstrings" } },
    sh = { template = { annotation_convetion = "google_bash" } },
    typescript = { template = { annotation_convention = "tsdoc" } },
    typescriptreact = { template = { annotation_convention = "tsdoc" } },
  },
}
