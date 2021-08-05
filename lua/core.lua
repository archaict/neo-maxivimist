--  FILE  : Core Lua
--  AUTH  : Archaict
--  NOTE  : The Opinionated Configuration file

local M = {}
local codex = M
local dirs = vim.fn.expand

--  VAULT  : Core Configuration

    codex.core= {

      colorscheme = 'ayu',

    } --------------------------------------------------------------- [ KM ] ---

    codex.directories= {
      --  NOTE  : used in nvim-fzf
      project = {
        dirs'~/.config',                  -- Dots
        dirs'~/.config/nvim',             -- Neovim Config
        dirs'~/Dropbox',                  -- Dropbox
        dirs'~/Dropbox/sigil',            -- Sigil
        dirs'~/Dropbox/vault',            -- OrgMode
      },

      dotfiles  = '~/Dropbox/codex',
      dotconfig = '~/.config',
      vimconfig = '~/.config/nvim',

      neorg     = '~/Dropbox/neorg',
      orgmode   = '~/Dropbox/vault',
      orgroam   = '~/Dropbox/vault/roam',

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
        'compe',                      -- Completion compe
        'floaterm',
        'hop',
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
        -- Telescope
        -- { 'tamago324/telescope-openbrowser.nvim' },
        -- { 'nvim-telescope/telescope-project.nvim' },
        -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        -- { 'nvim-telescope/telescope-media-files.nvim' },
        -- { 'nvim-telescope/telescope-packer.nvim', disable = true },
        -- { 'dhruvmanila/telescope-bookmarks.nvim' },
        -- { 'nvim-telescope/telescope-fzf-writer.nvim' },
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
      -- vim.g.loaded_plugins
      },

    } --------------------------------------------------------------- [ DB ] ---


return codex
