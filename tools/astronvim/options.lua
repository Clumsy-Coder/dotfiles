return {
  opt = {
    -- setting cursor style in different modes
    -- check current guicursor value with command ':set guicursor'
    -- https://github.com/AstroNvim/AstroNvim/issues/903#issuecomment-1219860755
    -- https://vim.fandom.com/wiki/Configuring_the_cursor
    -- i = insert
    -- v = visual
    -- c = command
    -- n = normal
    guicursor = "n-v-c-i-sm:block,ci-ve:ver25,r-cr-o:hor20",
    cursorline = true,
    colorcolumn = { 100 },
    -- code folding
    -- conceallevel = 0, -- enable conceal
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
  },
}
