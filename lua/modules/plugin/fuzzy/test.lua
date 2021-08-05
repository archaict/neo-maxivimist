  local dirs = require'core'.directories

  local project_dirs = {
    vim.fn.expand'~/.config',                  -- Dots
    vim.fn.expand'~/.config/nvim',             -- Neovim Config
    vim.fn.expand'~/Dropbox',                  -- Dropbox
    vim.fn.expand'~/Dropbox/sigil',            -- Sigil
    vim.fn.expand'~/Dropbox/vault',            -- OrgMode
  }

  local action = require "fzf.actions".action
  coroutine.wrap(function()
    local choice = require "fzf".fzf(  project_dirs , '--preview="ls -la {}"')

    if choice then
      require('fzf-lua').files({
        prompt  = 'Project » ',
        cwd = choice[1];
      })
      vim.cmd('chdir' .. choice[1])
    end
  end)()
