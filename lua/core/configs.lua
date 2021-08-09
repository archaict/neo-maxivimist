-- core.lua - (;,;) - [ setting up local variables ] ----------------------------
local g = vim.g -- global variables
local o = vim.o -- global options
local b = vim.bo -- buffer -scoped options
local w = vim.wo -- windows-scoped options
local fn = vim.fn
local opt = vim.opt
local cmd = vim.cmd -- execute Vim commands
CACHE = vim.fn.stdpath "cache"
local indent = 2
local core = require'core'.core
---------------------------------------------------------------------------------

-- [ Init ] {{{

o.syntax = "enable"
o.wildmenu = true
o.wildmode = "list:full"
o.complete = "i"
o.nrformats = "octal"
o.backspace = "indent,eol,start"
o.clipboard = "unnamedplus"
o.fileencoding = "utf-8"
o.fileformats  = "unix,dos,mac"
o.completeopt  = "menuone,noselect"

-- }}}
-- [ Neovim UI ] {{{

o.mouse = "a"
g.colors_name = core.colorscheme
o.background = "dark"
o.termguicolors = true
o.guifont = "Iosevka Nerd Font:h16:b"

o.updatetime = 300
o.timeout = true
o.timeoutlen = 1000

o.hlsearch = true
o.incsearch = true
o.showmatch = true
o.smartcase = true
o.ignorecase = true

w.wrap = false
o.hidden = true

o.expandtab = true
o.shiftround = true
o.smarttab = false
o.tabstop = indent
o.shiftwidth = indent
o.softtabstop = indent

o.autoindent = true
o.smartindent = true

w.list = true
g.indentLine_char = '|'
opt.listchars = { tab = "» ", trail = "·" }
opt.fillchars = { eob = " ", fold = " " }

o.lazyredraw = true
o.showtabline = 2
o.number = true
o.numberwidth = 4
o.colorcolumn = "0"
o.cursorline = true
o.scrolloff = 10
o.sidescrolloff = 10
o.pumheight = 20
w.signcolumn='yes:1'

o.ruler = true
o.laststatus = 2
o.cmdheight = 1

o.splitbelow = true
o.splitright = true

o.showmode = false
o.showcmd = true

-----------------------------------------------------------------------------}}}
-- [ Management ] {{{

o.shell = '/usr/bin/env zsh'
o.ttyfast = true
o.ttimeout = true
o.ttimeoutlen = 50
-- o.shortmess = "c"
o.history = 5000
b.swapfile = false
o.undofile = true
o.autoread = false
o.autochdir = true

-----------------------------------------------------------------------------}}}
-- [ Session ] {{{

Session = "~/.local/share/nvim/sessions/"
SessName = ".obsession"
cmd("set sessionoptions-=options")
cmd("silent! !mkdir -p " .. Session )
cmd("au! VimLeavePre * mks! " .. Session .. SessName)

----------------------------------------------------------------------------------}}}
-- [ Filetype ] {{{

cmd "filetype on"
cmd "filetype plugin on"
cmd "filetype plugin indent on"
cmd "set iskeyword+=-"
cmd "set inccommand=split"

abbrev "Q q"
abbrev "W w"
abbrev "q1 q!"
abbrev 'Qa qa!'
abbrev 'qa1 qa!'
abbrev 'q w<bar>bd!'
abbrev "Wq wq"
abbrev "wQ wq"
abbrev "WQ wq"
abbrev "wqa1 wqa!"
abbrev 'Wqa wqa!'
abbrev 'qa qa!'
abbrev 'wqa wqa!'

-----------------------------------------------------------------------------}}}
-- [ Neovide ] {{{

cmd("let g:neovide_cursor_vfx_mode = 'railgun'") -- neovide
cmd("let g:neovide_transparency = 0.85") -- neovide

-----------------------------------------------------------------------------}}}
-- [ Others ] {{{

cmd("set sessionoptions-=options")

function create_if_not_exists(folder)
  if not vim.fn.isdirectory(folder) then
    vim.fn.mkdir(folder)
  end
end

local home = os.getenv("HOME")
o.undodir = home .. "/.cache/nvim/undo"
-- o.backupdir = home .. "/.cache/nvim/backup"
create_if_not_exists( home .. "/.cache/nvim/undo" )
create_if_not_exists( home .. "/.cache/nvim/backup" )

-----------------------------------------------------------------------------}}}
-- [ Folds ] {{{

w.foldmethod = 'marker'
opt.foldtext = 'v:lua.custom_fold_text()'
function _G.custom_fold_text()
    local line = fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local line_text = fn.substitute(line, '{\\+', '', 'g')
    local fillcharcount = 73 - fn['len'](line_text) - fn['len'](folded_line_num)
    return "" .. line_text .. fn['repeat'](' ', fillcharcount) .. 'Line: ' .. line_count
end

-----------------------------------------------------------------------------}}}
