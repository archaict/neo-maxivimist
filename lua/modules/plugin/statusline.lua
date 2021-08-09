local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

local components = {
  left  = {active = {}, inactive = {}},
  mid   = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}

local vi_mode_colors = {

  NORMAL  = 'green',
  OP      = 'green',
  INSERT  = 'red',
  VISUAL  = 'blue',
  BLOCK   = 'blue',
  REPLACE = 'violet',
  ENTER   = 'cyan',
  MORE    = 'cyan',
  SELECT  = 'orange',
  COMMAND = 'orange',
  SHELL   = 'green',
  TERM    = 'green',
  NONE    = 'yellow',
  ['V-REPLACE'] = 'violet',

}

local vi_mode_text = {

  -- NORMAL  = 'ノーマル ',
  -- OP      = 'オップ ',
  -- INSERT  = 'インサート ',
  -- VISUAL  = 'ビジュアル ',
  -- BLOCK   = 'ブロック ',
  -- REPLACE = 'レプレース ',
  -- ENTER   = 'エンター ',
  -- MORE    = 'モー ',
  -- SELECT  = 'セレクト ',
  -- COMMAND = 'コマーンド ',
  -- SHELL   = 'シェル ',
  -- TERM    = 'ターミナル ',
  -- NONE    = 'ナン ',
  -- ['V-REPLACE'] = 'ビー・レプレース ',
-- 
  NORMAL  = '  ',
  OP      = '  ',
  INSERT  = '  ',
  VISUAL  = '  ',
  BLOCK   = '  ',
  REPLACE = '  ',
  ENTER   = '  ',
  MORE    = '  ',
  SELECT  = '  ',
  COMMAND = '  ',
  SHELL   = '  ',
  TERM    = '  ',
  NONE    = '  ',
  ['V-REPLACE'] = 'V-REPLACE',

}

-- LEFT
--
-- vi-mode  
components.left.active[1] = {
  provider = ' ',
  hl = function()
    local val = {}
    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'
    return val
  end,
}

-- vi-text
components.left.active[2] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.fg = 'blue' --vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
    left_sep  = {str = ' ', hl = { fg = 'fg', bg = 'bg',}},
    right_sep = {str = ' ', hl = { fg = 'fg', bg = 'bg',}},
}

-- fsize
components.left.active[3] = {
  provider = 'file_size',
  hl = { fg = 'fg', bg = 'bg', style = 'bold' },
  left_sep  = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
  right_sep  = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
}

-- FNAME
components.left.active[4] = {
  -- function() return string.format(vim.fn.pathshorten(vim.fn.expand('%:p'))) end,
    provider = function()
    local filename  = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
      return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
    end,
    hl = { fg = 'fg', bg = 'bg', style = 'bold' },
    left_sep   = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
    right_sep  = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
}

-- FNAME
components.left.active[5] = {
  -- function() return string.format(vim.fn.pathshorten(vim.fn.expand('%:p'))) end,
    provider = function() return '%t' end,
    hl = { fg = 'fg', bg = 'bg', style = 'bold' },
    left_sep  = {str = ' ', hl = { fg = 'fg', bg = 'bg',}},
    right_sep = {str = ' ', hl = { fg = 'fg', bg = 'bg',}},
}

-- gitBranch
components.left.active[6] = {
  provider = 'git_branch',
  hl = { fg = 'yellow', bg = 'bg', style = 'bold' }}

-- diffAdd
components.left.active[7] = {
  provider = 'git_diff_added',
  hl = { fg = 'green', bg = 'bg', style = 'bold' }}

-- diffModfified
components.left.active[8] = {
  provider = 'git_diff_changed',
  hl = { fg = 'orange', bg = 'bg', style = 'bold' }}

-- diffRemove
components.left.active[9] = {
  provider = 'git_diff_removed',
  hl = { fg = 'red', bg = 'bg', style = 'bold' }}

-- MID

-- LspName
components.mid.active[1] = {
  provider = 'lsp_client_names',
  hl = { fg = 'yellow', bg = 'bg', style = 'bold' },
  right_sep = ' '
}

-- diagnosticErrors
components.mid.active[2] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = { fg = 'red', style = 'bold' } }
-- diagnosticWarn
components.mid.active[3] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = { fg = 'yellow', style = 'bold' } }
-- diagnosticHint
components.mid.active[4] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = { fg = 'cyan', style = 'bold' } }
-- diagnosticInfo
components.mid.active[5] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = { fg = 'skyblue', style = 'bold' } }

-- RIGHT

-- battery

components.right.active[1] = {
  provider = function()
      return '%{battery#component()}'
  end,

  hl = { fg = 'fg', bg = 'bg', style = 'bold' },
  left_sep  = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
  right_sep = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
}

components.right.active[2] = {
  provider = function()
      return string.format(vim.fn.strftime'%d %b %Y  %H:%M')
  end,

  hl = { fg = 'fg', bg = 'bg', style = 'bold' },
  left_sep  = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
  right_sep = { str = '', hl = { fg = 'fg', bg = 'bg' }},
}

-- encoding
components.right.active[3] = {
  provider = 'file_encoding',
  hl = { fg = 'fg', bg = 'bg', style = 'bold' },
  left_sep  = { str = '  ', hl = { fg = 'fg', bg = 'bg' }},
  right_sep = { str = ' ', hl = { fg = 'fg', bg = 'bg' }},
}

-- vi-mode
components.right.active[4] = {
  provider = '  ';
  hl = function()
    local val = {}
    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'
    return val
  end,
}

-- INACTIVE

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

properties.force_inactive.buftypes = {
  -- 'terminal'
}

function theme ()
  if vim.g.colors_name == 'ayu' then
    return require('colors.ayu').ayu
  elseif vim.g.colors_name == 'nord' then
    return require('colors.nord').nord
  end
end

require('feline').setup({
  colors = theme(),
  vi_mode_colors = vi_mode_colors,
  components = components,
  properties = properties,
})

