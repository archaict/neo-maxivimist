
-- [ Builtins ] -----------------------------------------

cmd("au! BufWinEnter,WinEnter term://* startinsert")
cmd("au! TermOpen term://* setlocal nonumber  laststatus=0")

cmd([[
  " | Fuzzy Finder Builtins
  set path=$PWD/**
  set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**
  set wildignore+=**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
  set wildignore+=*.pdf,*.psd
]])

cmd 'let g:neovide_cursor_vfx_mode = "railgun"'
cmd("au! Vimresized * :wincmd =")
cmd("au! FocusLost,WinLeave * :silent! noautocmd w")
cmd("au! BufEnter * if expand('%:p:h') !~ '^/tmp' | silent! lcd %:p:h | endif")
cmd("set sessionoptions-=options")
cmd('au! BufLeave * silent! normal! m"') -- marking cursor position
cmd('au! BufEnter * silent! normal! g`"') -- remember cursor position
cmd("au! BufWritePre * :%s/\\s\\+$//e") -- remove trailing whitespaces

-- [ Fixes ]
vim.cmd ([[
  cnoreabbrev q w<bar>bd!
  cnoreabbrev wqa1 wqa!
  cnoreabbrev qa1 qa!
  cnoreabbrev Qa qa
  cnoreabbrev Wqa wqa
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev B buffer
]])
