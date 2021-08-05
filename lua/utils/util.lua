-- util.lua
-- taken from Neovim-me framework
-- https://github.com/RaafatTurki/neovim-me
SLS = "/"
SMC = ";"
DOT = "."
RET = "<CR>"
LBR = "["
RBR = "]"

-- :
function cmd(prop) vim.cmd(prop) end

-- :set
function set(prop) vim.cmd('set '..prop) end

-- :setlocal
function setlocal(prop) vim.cmd('setlocal '..prop) end

-- :hi
function hi(prop) vim.cmd('hi '..prop) end

-- :cnoreabbrev
function abbrev(arg) vim.cmd('cnoreabbrev '..arg) end

-- :autocmd
function autocmd(cmd) vim.cmd('autocmd '..cmd) end

-- gets a color value from (group, id)
function get_col(group, id) return vim.fn.synIDattr(vim.fn.hlID(group), id) end

-- sets a global var
function let(k, v) vim.g[k] = v end

-- gets a global var
function get(k) return vim.g[k] end

-- maps a key
local opts = opts or { noremap = true, silent = true }
function map( mode, lhs, rhs ) vim.api.nvim_set_keymap(mode, lhs, rhs, opts) end
function nmap( lhs, rhs ) vim.api.nvim_set_keymap( 'n', lhs, rhs, opts ) end
function imap( lhs, rhs ) vim.api.nvim_set_keymap( 'i', lhs, rhs, opts ) end
function vmap( lhs, rhs ) vim.api.nvim_set_keymap( 'v', lhs, rhs, opts ) end
function tmap( lhs, rhs ) vim.api.nvim_set_keymap( 't', lhs, rhs, opts ) end

-- maps a key with rhs expanded
-- function remap(mode, lhs, rhs, opts)
--     opts = opts or { silent = true }
--     vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
-- end

-- creates a command
function command(cmd, nargs, attrs)
    local attrs = attrs or ''
    local nargs = nargs or 0
    vim.cmd('command'..attrs..' -nargs='..nargs..' '..cmd)
end

-- creates an auto group
function augroup(autocmd, name)
    name = name or 'end'
    vim.api.nvim_exec('augroup '..name..' \nautocmd!\n'..autocmd..'\naugroup end', false)
end

local M = {}
local module = require('core').modules.plugin
function M.loader(alias,plugin)
  if module[alias] then
    vim.cmd ("packadd '" .. plugin .. "'")
  end
end

--- Check if a file or directory exists in this path
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

--- Check if a directory exists in this path
function M.isdir(path)
   return exists(path.."/")
end

-- [ Reload Config ]

function reload_config()
  vim.cmd "so ~/.config/nvim/init.lua"
  vim.cmd "so ~/.config/nvim/lua/core/binds.lua"
  vim.cmd "so ~/.config/nvim/lua/plugin.lua"
  vim.cmd "so ~/.config/nvim/lua/core/motion.lua"
  vim.cmd "so ~/.config/nvim/lua/modules/plugin/statusline.lua"
  vim.cmd "echomsg 'Neo-Minivimist Reloaded!'"
end

-- Can be used for mappings function --------------
local mappings = {
  ['<space>hr'] = ':lua reload_config{}<cr>',
}

for k,v in pairs(mappings) do
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_set_keymap( 'n', k, v, opts )
end
-- Can be used for mappings function --------------


return M
-- if module['dashboard'] then
--   vim.cmd ("packadd dashboard-nvim")
-- end
