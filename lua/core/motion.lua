local config = require('core') -- need Telescope & WhichKey
if config.modules.leader then
  -- motion.lua ---------------------------------------
  --  NOTE  : ReloadConfiguration and Plugins < Changes
  -- requires -----------------------------------------
  local wk = require("which-key")
  local TFLOAT = '<cmd>FloatermNew --height=0.9 --width=0.6 --wintype=float '
  -----------------------------------------------------

  -- WhichKey
  -- add :silent! if error
  local binds = {

  -- BOF BINDINGS -----------------------------------
    ["<C-f>"] = { "Search"};
    ["<C-p>"] = { "Open Projects" };
    ["<C-g>"] = { "Find All Files"},

    ["<C-e>"] = {
      name = 'Execute',
      ["<C-q>"] = { "Execute: Quit!" },
      ["<C-w>"] = { "Next Window" },
    };

  -- Bufferline Jumps
    ["<space>jj"] = { "Next Buffer" };
    ["<space>kk"] = { "Previous Buffer" };

  -- Lead me in
    ["<leader>"] = {
      -- | DOTS | Need Symbols
        [RET] = { "Project Lists" };
        [DOT] = { "Open Current Directory"};
        [SMC] = { "M-X (à la emacs)"};
        [SLS] = { "Search Inside Buffer" };
        [RBR] = { "Next Buffer" };
        [LBR] = { "Previous Buffer" };


      b = { -- | BUFF | Buffer related keybinds
            --  DONE: Buffer delete is a bit wonky with shade [ plugin ]
        name = "Buffers on Neovim",
        K = { "Kill Buffer" };
        k = { "Kill Buffer" };
        n = { "Next Buffer" };
        r = { "Refresh Buffer" };
        p = { "Previous Buffer" };
        b = { "Buffers List" };
      },


      d = { -- | DIRS | Directory related bindings
        name = "Directories",
        d = { "Open Directory" };
        f = { "Open Directory" };
      },


      f = { -- | FILE | Find, browser, recents all in your project folder.
        name = "Files",
        c = { "Really?" };
        r = { "Recent Files" };
        b = { "Open Buffers List" };
        h = { "Telescope Builtins" };
        j = { "Jump to directory"};
        l = { "Browser bookmarks"};
        t = { "All Todos!" };
        f = { "Find File" };
        P = { "Packer: Config" };
        m = { "Find: Motion" };
        a = { "Find All Files"},
        W = { "search Pictures" },
        w = { "Set Wallpaper" },
        v = { "Vim Config" },
        p = { "Vim Config" },
        d = { "Open Personal DotFiles" },
        x = { "Search Packer" };
        s = { "Find Snippets" };
        g = { "Search in Project" };
      },


      F = {
        name = "Find"
      },


      g = { -- | GOIN | Going Somewhere?
        name = "Go Somewhere",
        o = { "SuperZen" };
        g = { "Zen-Mode"  };
        j = { "Chase Line Down" };
        k = { "Chase Line Up" };
      },


      h = { -- | HELP |  Do you need my help?
        name = "Help Desk",
        t = { "Change Theme" };
        o = { "Help: Options" };
        i = { "Telescope Hightlights" };
        e = { "Help" };
      },


      i = { -- | INST | Insert Something?
        name = "Inserts",
      },


      j = { -- | JUMP | Jumping all round
        name = "Jump inside buffers",
        j = { "Next Buffer" }
      },

      k = { -- | KLOS | (K)lose those pesky windows
        name = "Close Anything",
        k = { "Previous Buffer" }
      },


      n = { --  | NORG | Org-Mode on Neovim! |  TODO: Add more Neorg related stuff
        name = "Open Something",
        o = { "Org: Roam" };
        r = { "Org: Roam" };
        p = { "Neorg: Roam" },
        n = { "Neorg: Roam" },
        d = { "Neorg: Dashboard" },
        t = { "Neorg: Todo" };
      },


      o = { -- | OPEN | Open gate to the moon! |  TODO: Add more keybinds
        name = "Open Something",
        d = { "Open Dashboard" };
        a = { "Open Org Agenda" };
        c = { "Open Org Capture" };
        o = { "Toggle Terminal" };
        t = { "Toggle Terminal" };
        r = { "Open Ranger" };
        g = { "Open Lazygit"};
      },


      p = { -- | PROJ | Project related stuff
        name = "Project",
        p = { 'Project Directories'};
        i = { "Packer: Install" };
        s = { "Packer: Sync" };
        c = { "Packer: Compile" };
        C = { "Packer: Clean" };
      },


      q = { -- | QUIT | Are you done?
        name = "Quit, are your done?",
        a = { "Quit All" };
        q = { "Quit All" };
        d = { "Save Quit All" };
        w = { "Write and Quit" };
      },


      r = { -- | RELS | Need some refreshers
        name = "Reload Neovim",
        r = { "Reload buffer" };
      },


      s = { -- | SRCH | Looking up to the moon
        name = "Search & Sessions",
        s = { "Session: Save" };
        l = { "Session: Load" };
        b = { "Search: Buffer" };
        p = { "Search: Project" };
        P = { "Search in Project" };
      },


      S = { -- | SRCE | Source of your research
        name = "Source",
        S = { ":source %<CR>"                       , "Source current file" };
        P = { ":source ~/.config/nvim/lua/plugins.lua<CR>", "Source Plugins" };
      },


      t = { -- | TOGS | On and off, 0 and 1
        name = "Toggle",
        c = { ":Codi!!<CR>"                         , "Codi" };
        a = { ":silent! TZAtaraxis<CR>"             , "Zen" };
        s = { ":TZMinimalist<CR>"                   , "Number and Line" };
        l = { ":call ChangeLineNumbering()<CR>"     , "Line Numbering" };
        m = { ":silent! !~/bin/mouse-toggle<CR>"    , "Toggle Mouse" };
        b = { ":silent! !~/bin/refb<CR>"            , "Bluetooth On" };
        B = { ":silent! !bluetoothctl power off<CR>", "Bluetooth Off" };
      },

      T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>"                   , "Treesitter: Info" };
        I = { ":TSInstall "                         , "Treesitter: Install" };
        u = { ":TSUpdate<cr>"                       , "Treesitter: Update" };
      },

      v = { -- | VLUG | (V)im, pack your stuff in or out?
        name = "Plugins",
        t = { "Vim: Todo" };
      },


      w = { -- | WIND | Let's move the windows
        name = "Window",
    ["="] = { "Window: Equal" };
      },


      ['<leader>'] = { -- EasyMotion
    -- [SPC] = { "za"                                  , "Fold Toggle" };
    [SLS] = { "<Plug>(easymotion-sn)"               , "Easymotion" };
        w = { "<Plug>(easymotion-overwin-f)"        , "Easymotion" };
        f = { "<Plug>(easymotion-overwin-f)"        , "Easymotion" };
        s = { "<Plug>(easymotion-bd-w)"             , "Easymotion" };
      },


      z = { -- | ZAPS | Zap it in or out?
        name = "Zaps",
        s = { ":set spell<CR>"                      , "Enable Spell checker" };
        S = { ":set nospell<CR>"                    , "Disable Spell checker" };
      },


  -- EOF BINDINGS -----------------------------------
    }
  }
  -- OPTS
  -- mode    = 'n',  -- use 'n' / 'v' / to specify
  -- nowait  = true, -- use `nowait` when creating keymaps
  -- noremap = true, -- use `noremap` when creating keymaps
  -- buffer  = nil,  -- Global mappings.
  -- silent  = true, -- use `silent` when creating keymaps
  -- prefix  = "<leader>", -- Leader Key?

  wk.register( binds, { mode = 'n' , noremap = true } )
  wk.register( binds, { mode = 'v' , noremap = true } )
end
