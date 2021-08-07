
local api = vim.api
-- Taken from https://github.com/norcalli/nvim_utils
local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autocmds = {

  terminal = {
    {
      'TermOpen',
      'term://*',
      'setlocal norelativenumber nonumber laststatus=0'
    },
    { 'BufWinEnter,WinEnter','term://*', 'startinsert' },
  },

  cursor_position = {
    { 'BufLeave', '*', 'silent! normal! m"' },
    { 'BufEnter', '*', 'silent! normal! g`"' },
  },

  remove_trailing_whitespace = {
    { 'BufWritePre', '*', ':%s/\\s\\+$//e' },
  },

  save_on_switch_buffer = {
    { 'FocusLost,WinLeave', '*', ':silent! noautocmd w' },
  },

  vim_resized_on_window_resize = {
    { 'Vimresized', '*', ':wincmd =' },
  },

  others = {
    { 'BufEnter', '*', 'if expand("%:p:h") !~ "^/tmp" | silent! lcd %:p:h | endif' },
  },
  markdown = {
    { 'BufNewFile,BufFilePre,BufRead', '*.md', 'set filetype=markdown.pandoc' },
  },

}

nvim_create_augroups(autocmds)

-- [ Builtins ] -----------------------------------------

cmd([[
  " | Fuzzy Finder Builtins
  set path=$PWD/**
  set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**
  set wildignore+=**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
  set wildignore+=*.pdf,*.psd
]])

-- [ Fixes ]
