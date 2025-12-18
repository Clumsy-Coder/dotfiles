-- Config: session-manager
-- Shatur/neovim-session-manager
--
-- obtained from:
--    https://github.com/datamonsterr/astronvim_config/blob/main/plugins/session_manager.lua

return {
  autosave_last_session = true,
  autosave_ignore_dirs = {
    ".git"
  },
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    'gitrebase'
  },
}
