-- Config: typescript
-- jose-elias-alvarez/typescript.nvim
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/f75107090a877bee07237861d29665cd83e9a9e8/plugins/lsp.lua?position=source-3.1-8.5-1

return {
  server = require("astronvim.utils.lsp").config("tsserver")
}
