-- [ init.lua ]
-- Neovim Opinionated Configuration

-- [ Utility ]
require('utils.util')
-- [ Core configurations ]
-- Core configuration should work
-- with or without plugins
require('core')
require('core.autocmds')
require('core.highlights')
require('core.functions')
require('core.configs')
require('core.binds')

-- [ Plugins ]
require('plugin')
require('profile.user-config')
vim.cmd([[
  function! SyncPluginsAndQuit()
    autocmd User PackerComplete qa
    PackerSync
  endfunction
]])

