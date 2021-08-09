local actions = require "fzf-lua.actions"
local default_opts ={
  ["default"] = actions.file_edit,
  ["ctrl-s"]  = actions.file_split,
  ["ctrl-v"]  = actions.file_vsplit,
  ["ctrl-t"]  = actions.file_tabedit,
  ["ctrl-q"]  = actions.file_sel_to_qf,
  ["ctrl-y"]  = function(selected) print(selected[2]) end,
}

require'fzf-lua'.setup {
  winopts = {
-- Default
    win_height       = 0.85,            -- window height
    win_width        = 0.80,            -- window width
    win_row          = 0.30,            -- window row position (0=top, 1=bottom)
    win_col          = 0.50,            -- window col position (0=left, 1=right)
-- BOTTOM
    -- win_height       = 0.30,            -- window height
    -- win_width        = 1,            -- window width
    -- win_row          = 1,            -- window row position (0=top, 1=bottom)
    -- win_col          = 0,            -- window col position (0=left, 1=right)

    win_border       = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    window_on_create = function()         -- nvim window options override
      vim.cmd("set winhl=Normal:Normal")  -- popup bg match normal windows
    end,
  },
  -- fzf_bin             = 'sk',        -- use skim instead of fzf?
  fzf_layout          = 'default',      -- fzf '--layout=' / reverse
  fzf_args            = '',             -- adv: fzf extra args, empty unless adv
  fzf_binds           = {               -- fzf '--bind=' options
      'shift-down:preview-page-down',
      'shift-up:preview-page-up',
      'ctrl-d:half-page-down',
      'ctrl-u:half-page-up',
      'ctrl-a:toggle-all',
      'ctrl-l:clear-query',
  },
  preview_border      = 'border',       -- border|noborder
  preview_wrap        = 'nowrap',       -- wrap|nowrap
  preview_opts        = 'nohidden',     -- hidden|nohidden
  preview_vertical    = 'down:45%',     -- up|down:size
  preview_horizontal  = 'right:60%',    -- right|left:size
  preview_layout      = 'flex',         -- horizontal|vertical|flex
  flip_columns        = 120,            -- #cols to switch to horizontal on flex
  -- default_previewer   = "bat",       -- override the default previewer?
                                        -- by default auto-detect bat|cat
  previewers = {
    cmd = {
      -- custom previewer, will execute:
      -- `<cmd> <args> <filename>`
      cmd             = "echo",
      args            = "",
    },
    cat = {
      cmd             = "cat",
      args            = "--number",
    },
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
    head = {
      cmd             = "head",
      args            = nil,
    },
    termpix = {
        cmd             = "termpix",
        args            = "--width 110 --true-colour",
        _new            = function() return require 'fzf-lua.previewer'.cmd_async end,
    },
  },
  -- provider setup
  files = {
    prompt            = 'Files » ',
    cmd               = '',             -- "find . -type f -printf '%P\n'",
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    actions           = default_opts,
  },
  git = {
    prompt            = 'GitFiles » ',
    cmd               = 'git ls-files --exclude-standard',
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    icons = {
      ["M"]           = { icon = "M", color = "yellow" },
      ["D"]           = { icon = "D", color = "red" },
      ["A"]           = { icon = "A", color = "green" },
      ["?"]           = { icon = "?", color = "magenta" },
      -- ["M"]          = { icon = "★", color = "red" },
      -- ["D"]          = { icon = "✗", color = "red" },
      -- ["A"]          = { icon = "+", color = "green" },
    },
  },
  grep = {
    prompt            = 'Rg » ',
    input_prompt      = 'Grep For » ',
    -- cmd               = "rg --vimgrep",
    rg_opts           = "--hidden --column --line-number --no-heading " ..
                        "--color=always --smart-case -g '!{.git,node_modules}/*'",
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    actions           = default_opts,
  },
  oldfiles = {
    prompt            = 'History » ',
    cwd_only          = false,
  },
  buffers = {
    prompt            = 'Buffers » ',
    file_icons        = true,         -- show file icons?
    color_icons       = true,         -- colorize file|git icons
    sort_lastused     = true,         -- sort buffers() by last used
    actions = {
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
      ["ctrl-x"]      = actions.buf_del,
    }
  },
  colorschemes = {
    prompt            = 'Colorschemes » ',
    live_preview      = true,       -- apply the colorscheme on preview?
    actions = {
      ["default"]     = actions.colorscheme,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    },
    winopts = {
      win_height        = 0.55,
      win_width         = 0.20,
      window_on_create  = function()
        vim.cmd("set winhl=Normal:Normal")
      end,
    },
    post_reset_cb     = function()
      require('feline').reset_highlights() -- if feline installed
    end,
  },
  quickfix = {
    -- cwd               = vim.loop.cwd(),
    file_icons        = true,
    git_icons         = true,
  },
  lsp = {
    prompt            = 'LSP » ',
    -- cwd               = vim.loop.cwd(),
    file_icons        = true,
    git_icons         = false,
    lsp_icons         = true,
    severity          = "hint",
    icons = {
      ["Error"]       = { icon = "", color = "red" },       -- error
      ["Warning"]     = { icon = "", color = "yellow" },    -- warning
      ["Information"] = { icon = "", color = "blue" },      -- info
      ["Hint"]        = { icon = "", color = "magenta" },   -- hint
    },
  },
  -- placeholders for additional user customizations
  loclist = {},
  helptags = {},
  manpages = {},
  file_icon_colors = {
    ["lua"]   = "blue",
  },
}

--============================================================================--
-- EXTRA FZF FUNCTIONS
-- Directories listing in core configuration
local dirs = require'core'.directories
--============================================================================--

-- vim.fn.setenv(
--   "FZF_DEFAULT_OPTS",
--   "--inline-info'"
-- )

-- function fzf_projectionist()
--   local project_dirs = dirs.project
--   coroutine.wrap(function()
--     local choice = require "fzf".fzf(project_dirs)
--     if choice then
--       require('fzf-lua').files({
--         prompt  = 'Project » ',
--         cwd = choice[1];
--       })
--       vim.cmd('chdir' .. choice[1])
--     end
--   end)()
-- end

function fzf_projectionist()
  local action = require "fzf.actions".action
  coroutine.wrap(function()
    local choice = require "fzf".fzf( dirs.project , '--preview="ls -la --color=auto {}"')

    if choice then
      require('fzf-lua').files({
        prompt  = 'Project » ',
        cwd = choice[1];
      })
      vim.cmd('chdir' .. choice[1])
    end
  end)()
end

function fzf_vimconfig()
  -- local choice = '~/.config/nvim'
  local choice = dirs.vimconfig
  require('fzf-lua').files({
    prompt  = 'VimConfig » ',
    cwd = choice;
  })
  vim.cmd('chdir ' .. choice )
end

function fzf_orgmode()
  local choice = dirs.orgmode
  require('fzf-lua').files({
    prompt  = 'OrgFiles » ',
    cwd = choice;
  })
  vim.cmd('chdir ' .. choice )
end

function fzf_dotfiles()
  local choice = dirs.dotfiles
  require('fzf-lua').files({
    prompt  = 'DotFiles» ',
    cwd = choice;
  })
  vim.cmd('chdir ' .. choice )
end

function fzf_neorg()
  local choice = dirs.neorg
  require('fzf-lua').files({
    prompt  = 'Neorg » ',
    cwd = choice;
  })
  vim.cmd('chdir ' .. choice )
end

function fzf_nixos()
  local choice = dirs.nixos
  require('fzf-lua').files({
    prompt  = 'NixOS » ',
    cwd = choice;
  })
  vim.cmd('chdir ' .. choice )
end

function fzf_searchinbuffer()
  require('fzf-lua').grep_curbuf({
    prompt  = 'Search in Buffer » ',
  })
end

function fzf_searchinproject()
  require('fzf-lua').live_grep({
    prompt  = 'Search in Project » ',
  })
end

-- function fzf_wallpaper() -- Poor Man Wallpaper Changer (with preview)
--   local fzf = require("fzf").fzf
--   local img_dir = dirs.pictures
--   coroutine.wrap(function()
--     local choice = fzf('fd . '.. img_dir ..' -e png -e jpg',
--       [[--preview "((termpix --width 90 --true-colour {} > \
--         /tmp/fzfimg && cat /tmp/fzfimg) || bat {})"]])
--     if choice then
--       vim.cmd('silent !feh --bg-fill ' .. choice[1])
--     end
--   end)()
-- end

function fzf_wallpaper()
  require('fzf-lua').files({
    cwd       = dirs.pictures,
    prompt    = 'Wallpaper » ',
    previewer = "termpix",
    actions = {
      ["default"]  = function(selected) vim.cmd('silent !feh --bg-fill ' .. selected[2]) end
    },
  })
end

function fzf_autowallpaper()
  local fzf = require("fzf").fzf
  local action = require "fzf.actions".action

  coroutine.wrap(function()
    local preview_function = action(function (args)
      if args then
        local wall = args[1]
        vim.cmd("silent !feh --bg-fill " .. wall)
      end
    end)
    local choice = fzf('fd . ~/Pictures -e png -e jpg', "--preview=" .. preview_function .. " --preview-window right:0")
    if choice then
      vim.cmd('silent !feh --bg-fill ' .. choice[1])
    end

  end)()
end
-- Commands
vim.cmd('command! Nixconfig     call v:lua.fzf_nixos()')
vim.cmd('command! Vimconfig     call v:lua.fzf_vimconfig()')
vim.cmd('command! Project       call v:lua.fzf_projectionist()')
vim.cmd('command! Wallpaper     call v:lua.fzf_wallpaper()')
vim.cmd('command! Autowallpaper call v:lua.fzf_autowallpaper()')
