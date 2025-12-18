-- This function is run last when loading AstroNvim.
-- good place to configure mappings and vim options
return function()
  require("user.extras.autocmds")
  require("user.extras.filetypes")
end
