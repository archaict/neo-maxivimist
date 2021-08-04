local actions = require('telescope.actions')
-- require('telescope').load_extension('fzf')
require('telescope').setup{
  defaults = {
    mappings = {
    i = {
        ["<esc>"] = actions.close,
      },
    },
    preview_title = "",
    scroll_strategy = "cycle", -- cycle | limit
    layout_strategy = "bottom_pane",
    sorting_strategy = "ascending", -- ascending | descending
    layout_config = {
      height = 15,
    },
    border = true,
    borderchars = {
      "z",
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      -- results = { "a", "b", "c", "d", "e", "f", "g", "h" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    },
    dynamic_preview_title = true,
    entry_prefix = ' | ',
  },

  pickers = {

    buffers     = { sort_lastused = true },
    oldfiles    = { sort_lastused = true },
    live_grep   = { sort_lastused = true },
    grep_string = { sort_lastused = true },
    file_browser= { search_dirs={"%:p"} },

    find_files = {
      file_ignore_patterns = { "*.cache*", "%.env" },
      find_command = {
        "rg","--hidden"    ,"--files"     ,
        "-g","!.git"       ,"-g","!.ssh"  ,
        "-g","!.svn"       ,"-g","!.hg"   ,
        "-g","!.hyper"     ,"-g","!.cache",
        "-g","!.local"     ,"-g","!.cargo",
        "-g","!.wget-hsts" ,"-g","!.mp4" ,
        "-g","!.mp3"       ,
      },
      search_dirs={"%:p"},
    },
  },
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                    -- false will only do exact matching
  --     override_generic_sorter = false, -- override the generic sorter
  --     override_file_sorter = true,     -- override the file sorter
  --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --   },
  --   project = {
  --     display_type = 'full';
  --     hidden_files = true
  --   };
  --   media_files = {
  --     filetypes = {"png", "webp", "jpg", "jpeg"},
  --     find_cmd = "rg", -- find command (defaults to `fd`)
  --   };
  --   fzf_writer = {
  --     minimum_grep_characters = 0,
  --     minimum_files_characters = 0,
  --     use_highlighter = true,
  --   };
  --   openbrowser={
  --     bookmarks = {
  --       ['github'] = 'github.com';
  --       ['LunarVim'] = 'https://github.com/ChristianChiarulli/LunarVim';
  --       ['Neovim Reddit'] = 'https://www.reddit.com/r/neovim/';
  --       ['NVim Lua Guide'] = 'https://github.com/nanotee/nvim-lua-guide';
  --       ['Fast Search RG'] = 'https://mariusschulz.com/blog/fast-searching-with-ripgrep';
  --     };
  --     bookmark_filepath = '~/config/nvim/telescope_openbrowser_bookamarks'
  --   };
  -- },
}

function DotProject() vim.cmd( ":lua require'telescope'.extensions.project.project{}" ) end
-- BOF custom module functionn
-- lua require('module.telescope').search_dotfiles()
local M = {}

M.browser = function()
  require('telescope.builtin').file_browser({
    cwd = '~'
  })
end

M.search_all = function()
  require('telescope.builtin').find_files({
    layout_strategy = "horizontal",
    layout_config = {
      height = 40,
    },
    find_command = {
      "rg","--hidden"    ,"--files"     ,
      "-g","!.git"       ,"-g","!.ssh"  ,
      "-g","!.svn"       ,"-g","!.hg"   ,
      "-g","!.hyper"     ,"-g","!.cache",
      "-g","!.local"     ,"-g","!.cargo",
      "-g","!.wget-hsts" ,"-g","!.mp4" ,
      "-g","!.mp3"       ,"-g","!.png" ,
      "-g","!.jpg"       ,"-g","!.svg" ,
      "-g","!.exe"       ,"-g","!.gif" ,
      "-g","!.zip"
    },
  })
end

M.search_packer = function()
  require('telescope').extensions.packer.plugins({
    layout_strategy = "horizontal",
    layout_config = {
      height = 40,
    },
  })
end

M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = "Dotfiles";
    layout_strategy = "bottom_pane",
    cwd = require'core'.directories.dotfiles;
  })
end

M.search_dotnvim = function()
  require('telescope.builtin').find_files({
    prompt_title = "NeoVim";
    layout_strategy = "bottom_pane",
    cwd = require'core'.directories.vimconfig;
  })
end

M.search_dotconfig = function()
  require('telescope.builtin').find_files({
    prompt_title = "NeoVim";
    layout_strategy = "bottom_pane",
    cwd = require'core'.directories.dotconfig;
  })
end

M.search_neorg = function()
  require('telescope.builtin').find_files({
    prompt_title = "Notebook";
    layout_strategy = "bottom_pane",
    cwd = require'core'.directories.neorg;
  })
end

-- lua require('module.telescope').search_roam()
M.search_roam = function()
  require('telescope.builtin').find_files({
    prompt_title = "Org Roam";
    layout_strategy = "bottom_pane",
    cwd = require'core'.directories.orgroam;
  })
end

-- lua require('module.telescope').search_pics()
M.search_pics = function()
  require('telescope').extensions.media_files.media_files({
    prompt_title = "Search Pictures";
    layout_config = { height = 0.8 },
    layout_strategy = "horizontal",
    cwd = "~";
  })
end


  -- Telescope

  function SetCwd()
    vim.cmd('cd ' .. vim.fn.getcwd())
    vim.cmd('cd ' .. vim.fn.expand('%:p:h'))
  end

  function GoPwd()
    SetCwd()
    vim.cmd(':Telescope file_browser')
  end

-- ThePrimeAgen Walls telescope
function SetBackground(content)
    vim.cmd( "!feh --bg-fill " .. content )
end

M.wall_selector = function()
    require("telescope.builtin").find_files({
        prompt_title = "[ Wallpaper Selector ] ",
        layout_strategy = "flex",
        layout_config = { height = 0.8 },
        cwd = "~/Pictures",

        attach_mappings = function(prompt_bufnr, map)
            function SetTheBackground(close)
                local content =
                    require('telescope.actions.state').get_selected_entry(bufnr)
                SetBackground(content.cwd .. "/" .. content.value)
                if close then
                    require('telescope.actions').close(prompt_bufnr)
                end
            end

            map('i', '<C-p>', function(bufnr)
                SetTheBackground()
            end)

            map('i', '<CR>', function(bufnr)
                SetTheBackground(true)
            end)

            -- Please continue mapping (attaching additional key maps):
            -- Ctrl+n/p to move up and down the list.
            return true
        end
    })
end

M.find_all = function()
  require("telescope.builtin").find_files({
    layout_strategy = "flex",
    layout_config = {
      height = 40,
    },
    cwd = "~";
  })
end
return M -- EOF custom module functionn
