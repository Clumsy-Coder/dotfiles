-- Config: todo-comments
-- folke/todo-comments.nvim
--
-- obtained from
--    https://github.com/folke/todo-comments.nvim#%EF%B8%8F-configuration

local icons = require("user.extras.icons")

return {
  keywords = {
    DONE = { icon = icons.todo.done, color = "done",         alt = { "COMPLETE" } },
    FIX  = { icon = icons.todo.fix,  color = "error",        alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "DEBUG" } },
    -- HACK = { icon = icons.todo.hack, color = "warning" },
    NOTE = { icon = icons.todo.note, color = "hint",         alt = { "INFO", "REVIEW" } },
    -- PERF = { icon = icons.todo.perf, color = "performance",  alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    TEST = { icon = icons.todo.test, color = "test" },
    TODO = { icon = icons.todo.todo, color = "todo" },
    -- WARN = { icon = icons.todo.warn, color = "warning",      alt = { "WARNING" } },
  },
  colors = {
    default = { "#ffeb3b" },
    done    = { "#4CAF50" },
    error   = { "#f06292" },
    -- info    = { "DiagnosticInfo",     "#2563EB" },
    hint    = { "Identifier",     "#10B981" },
    test    = { "DiagnosticHint",         "#FF00FF" },
    todo    = { "#ffbd2a" },
    -- warning = { "DiagnosticWarning",  "WarningMsg", "#FBBF24" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--glob=!node_modules",
      "--glob=!meta/dotbot",
    },
    pattern = [[\b(KEYWORDS):]],
  },
}

