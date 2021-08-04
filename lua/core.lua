--  FILE  : Core Lua
--  AUTH  : Archaict
--  NOTE  : The Opinionated Configuration file

local M = {}
local codex = M

--  VAULT  : Core Configuration

    codex.core= {

      colorscheme = 'ayu',

} --------------------------------------------------------------- [ KM ] ---

    codex.directories= {
      --  NOTE  : used in nvim-fzf
      project = {
        '~/.config',                  -- Dots
        '~/.config/nvim',             -- Neovim Config
        '~/Dropbox',                  -- Dropbox
        '~/Dropbox/sigil',            -- Sigil
        '~/Dropbox/vault',            -- OrgMode
      },

      neorg     = '~/Dropbox/neorg',
      orgmode   = '~/Dropbox/vault',
      dotfiles  = '~/Dropbox/codex',
      dotconfig = '~/.config',
      orgroam   = '~/Dropbox/vault/roam',
      vimconfig = '~/.config/nvim',
      pictures  = '~/Pictures',

    } --------------------------------------------------------------- [ KM ] ---

--  KEYMAP:

    Keymaps = {

        'essentials',                 -- Needed to reduce annoyance
        'movement',                   -- Movementes in NVI mode
        'shifting',                   -- Indentation and up down
        'tabs',                       -- Moving between tabs
        'buffers',                    -- Moving between buffers
        'sessions',                   -- Session management
        'terminal',                   -- Terminal movements
        'window',                     -- Navigate splits
        'quit',                       -- Do you need more desc?
        'files',                      -- Define what you need [binds.lua]
        'help',                       -- Easy help
        -- 'netrw',                      -- Navigation from netrw
        'optional',                   -- Extra stuff

--  PLUGINS  : Keymap for Plugins

        'packer',                     -- Packer plugins below
        'dashboard',
        'telescope',                  -- Seek the moon! [telescope]
        'nvimfzf',                    -- Fuzzy finding your mess [fzf-lua]
        'commentary',                 -- Commenting lines [tpope]
        'lspsaga',                    -- Defaults for lspsaga
        'autopairs',                  -- Poor man autopairs
        'floaterm',
        'easymotion',
        'nvimtree',
        'zen',

    } --------------------------------------------------------------- [ KM ] ---

--  THEMES:

    codex.highlights = { -------------------------------------------------------

        comment = 'italic',
        transparency = true,

    } --------------------------------------------------------------- [ KM ] ---

--  MODULE:

    codex.modules = {

      leader = true;
      builtins = {
        netrw = true;
        statusline = true;
      },

      plugins ={ -- Extra Plugins
        -- Colorschemes
        { 'srcery-colors/srcery-vim' },
        { 'arcticicestudio/nord-vim' },
      }

    } --------------------------------------------------------------- [ MD ] ---

--  OBSTRC:
    codex.disabled={

      builtins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "get",
        "getPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit",
      },

      plugin = {
      },

    } --------------------------------------------------------------- [ DB ] ---



return codex
