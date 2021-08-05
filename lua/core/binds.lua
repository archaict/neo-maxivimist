-- binds.lua --- [ setting up local variables ] ---
-- sane keybindings for your writing conveniences
local cmd = vim.cmd         -- execute Vim commands
local opts = { noremap = true, silent = true }
local config = require('core')
local ORG = config.directories.orgmode
local ROAM = config.directories.orgroam
-- requires ---------------------------------------
---------------------------------------------------
vim.g.mapleader  = ' '

local K = {}

function K.autopairs()
  -- cmd 'inoremap " ""<left>'
  -- cmd "inoremap ' ''<left>"
  -- cmd 'inoremap ( ()<left>'
  -- cmd 'inoremap [ []<left>'
  -- cmd 'inoremap { {}<left>'
  -- cmd 'inoremap {<CR> {<CR>}<ESC>O'
  -- cmd 'inoremap {;<CR> {<CR>};<ESC>O'
  -- poor man pairings
  vmap ( '<leader>"', 'c""<Esc>P' )
  vmap ( "<leader>'", "c''<Esc>P" )
  vmap ( "<leader>(", "c()<Esc>P" )
  vmap ( "<leader>{", "c{}<Esc>P" )
  vmap ( "<leader>[", "c[]<Esc>P" )
  vmap ( "<leader><", "c<><Esc>P" )
end

function K.essentials()

  cmd "nnoremap ; :"
  cmd "nnoremap : ;"

  nmap ( 'Q','q' )
  nmap ( 'q','<Nop>' )
  imap ( '<C-c>', '<ESC>' )
  -- No Highlights
  nmap ( '<BS>',':noh<CR>' )
  -- Find
  nmap ( '<C-f>','/' )
  -- Save Me
  nmap ( '<C-s>', ':w!<cr>' )
  vmap ( '<C-s>', ':w!<cr>' )
  imap ( '<C-s>', ':w!<cr>' )
  nmap ( '<Insert>', ':startinsert<CR>' )
  imap ( '<Insert>', '<C-o>:stopinsert<CR>' )
  nmap ( '<leader>tl', ':call ChangeLineNumbering()<CR>' )

  i = {
  -- Escape Sequence
['<C-U>'] = '<C-G>u<C-U>',
       jk = '<ESC>',
       kj = '<ESC>',
       jj = '<ESC>',
  }

for k,v in pairs(i) do vim.api.nvim_set_keymap( 'i', k, v, opts ) end end

function K.movement()
  -- Movement
  nmap ( 'j', 'gj' )
  vmap ( 'j', 'gj' )
  nmap ( 'k', 'gk' )
  vmap ( 'K', 'gk' )

  nmap ( 'H', '^' )
  nmap ( 'J', '15j' )
  nmap ( 'K', '15k' )
  nmap ( 'L', '$' )

  vmap ( 'H', '^' )
  vmap ( 'L', '$<Left>' )

  nmap ( '<c-z>', '<NOP>' )
  imap ( '<c-z>', '<NOP>' )
  vmap ( '<c-z>', '<NOP>' )

  imap ( '<c-j>', '<c-n>' )
  imap ( '<c-k>', '<C-p>' )

  nmap ( '<C-j>', '<C-D>' )
  nmap ( '<C-k>', '<C-U>' )

  -- nmap ( '<A-j>', '<C-D>' )
  -- nmap ( '<A-k>', '<C-U>' )

end

function K.commentary()
  vmap ( ';', ':Commentary<CR>' )
  vmap ( '/', ':Commentary<CR>' )
end

function K.shifting()

  -- Indentation
  vmap ( '<', ' <gv' )
  vmap ( '>', ' >gv' )

  -- Move line up and down
  nmap ( '<A-down>' , ":m .+1<CR>==" )
  nmap ( '<A-up>'   , ":m .-2<CR>==" )
  vmap ( '<A-down>' , ":m '>+1<CR>gv=gv" )
  vmap ( '<A-up>'   , ":m '<-2<CR>gv=gv" )
  imap ( '<A-down>' , "<Esc>:m .+1<CR>==gi" )
  imap ( '<A-up>'   , "<Esc>:m .-2<CR>==gi" )
end

function K.tabs()
  -- Move between tabs, check your wm first!
  nmap ( '<A-left>' , ':tabprevious<CR>' )
  nmap ( '<A-right>' , ':tabnext<CR>' )
  -- Moving through like tiling wm
  nmap ( '<c-t>' , ':tabnew<CR>' )
  nmap ( '<c-q>' , ':tabclose<CR>' )
  nmap ( '<A-1>' , ':tabfirst<CR>' )
  nmap ( '<A-2>' , '2gt' )
  nmap ( '<A-3>' , '3gt' )
  nmap ( '<A-4>' , '4gt' )
  nmap ( '<A-5>' , '5gt' )
  nmap ( '<A-6>' , '6gt' )
  nmap ( '<A-7>' , '7gt' )
  nmap ( '<A-8>' , '8gt' )
  nmap ( '<A-9>' , ":tablast<CR>"  )
  -- Same but from terminal
  tmap ( '<A-1>' , '<C-\\><C-n>:tabfirst<CR>' )
  tmap ( '<A-2>' , '<C-\\><C-n>2gt' )
  tmap ( '<A-3>' , '<C-\\><C-n>3gt' )
  tmap ( '<A-4>' , '<C-\\><C-n>4gt' )
  tmap ( '<A-5>' , '<C-\\><C-n>5gt' )
  tmap ( '<A-6>' , '<C-\\><C-n>6gt' )
  tmap ( '<A-7>' , '<C-\\><C-n>7gt' )
  tmap ( '<A-8>' , '<C-\\><C-n>8gt' )
  tmap ( '<A-9>' , '<C-\\><C-n>:tablast<CR>' )
  tmap ( '<C-Esc>', '<C-\\><C-n>' )
  -- Same but from insert mode
  imap ( '<A-1>' , '<C-\\><C-n>:tabfirst<CR>' )
  imap ( '<A-2>' , '<C-\\><C-n>2gt' )
  imap ( '<A-3>' , '<C-\\><C-n>3gt' )
  imap ( '<A-4>' , '<C-\\><C-n>4gt' )
  imap ( '<A-5>' , '<C-\\><C-n>5gt' )
  imap ( '<A-6>' , '<C-\\><C-n>6gt' )
  imap ( '<A-7>' , '<C-\\><C-n>7gt' )
  imap ( '<A-8>' , '<C-\\><C-n>8gt' )
  imap ( '<A-9>' , '<C-\\><C-n>:tablast<CR>' )
  imap ( '<C-Esc>', '<C-\\><C-n>' )
end

function K.buffers()
  -- Move to next buffer
  nmap ( '<C-e><C-n>' , ':bnext<cr>' )
  nmap ( '<C-e><C-p>' , ':bprevious<cr>' )
  -- Delete ( preserve layout ) or kill it!
  nmap ( '<leader>bk' , ':silent! bp|bd#<cr>')
  nmap ( '<leader>bK' , ':silent! bd!<CR>')
  -- Buffer navigation, switch like tiling wm
  nmap ( '<leader>jj' , ':silent! bnext<cr>')
  nmap ( '<leader>kk' , ':silent! bprev<cr>')
  nmap ( '<leader>br' , ':silent! so %<cr>')
  nmap ( '<leader>]' , ':silent! bnext<cr>')
  nmap ( '<leader>[' , ':silent! bprev<cr>')
end

function K.terminal()
  -- Open Terminal in new tab
  nmap ( "<C-o>" , ":tabnew<CR>:set nonumber<CR>:term<CR>i" )

  -- Terminal Toggle
  nmap ( '<leader>oo' , ':call TermToggle(10)<CR>'  )
  nmap ( '<leader>ot' , ':call TermToggle(10)<CR>'  )
  nmap ( '<C-e><C-e>' , ':call TermToggle(10)<CR>'  )
  nmap ( '<C-e><C-o>' , '<C-\\><C-n>:e '  )

  nmap ( '<C-e><C-w>' , '<C-\\><C-n><C-w><C-w>'  )
  nmap ( '<C-e><C-q>' , ':silent! bd!<cr>'  )
  nmap ( '<C-q><C-q>' , ':silent! bd!<cr>'  )
  nmap ( '<C-q>'      , '<NOP>'  )

  tmap ( '<C-e><C-e>' , '<C-\\><C-n>:call TermToggle(12)<CR>'  )

  tmap ( '<C-e><C-q>' , '<C-\\><C-n>:silent! bd!<Esc>'  )
  tmap ( '<C-e><C-n>' , '<C-\\><C-n>:silent! bnext<cr>' )
  tmap ( '<C-e><C-p>' , '<C-\\><C-n>:silent! bprev<cr>' )
  tmap ( '<C-e><C-o>' , '<C-\\><C-n>:e '  )
  tmap ( '<C-x>'      , '<C-\\><C-n>'  )
  tmap ( '<C-e><C-w>' , '<C-\\><C-n><C-w><C-w>'  )
  tmap ( '<C-q>'      , '<C-\\><C-n>:silent! bd!<CR>'  )

end

function K.sessions()
  nmap ( '<leader>ss' ,':mks! ' .. Session .. SessName .. '<CR>' )
  nmap ( '<leader>sl' ,':source ' .. Session .. SessName .. '<CR>' )
end

function K.window()
  -- Horizontal Resize
  nmap ( '<A-+>' ,':resize -5<CR>' )
  nmap ( '<A-_>' ,':resize +5<CR>' )

  -- Vertical Resize
  nmap ( '<A-=>',':vertical resize -5<CR>' )
  nmap ( '<A-->',':vertical resize +5<CR>' )

  -- Resize Equal
  nmap ( '<leader>w=', ':wincmd =<CR>' )

  -- Window movement
  nmap ( '<leader>wh' , '<C-w><C-h>' )
  nmap ( '<leader>wj' , '<C-w><C-j>' )
  nmap ( '<leader>wk' , '<C-w><C-k>' )
  nmap ( '<leader>wl' , '<C-w><C-l>' )
  nmap ( '<leader>wq' , '<C-w><C-q>' )
  nmap ( '<leader>ww' , '<C-w><C-w>' )
  nmap ( '<leader>wr' , '<C-w><C-r>' )

  nmap ( '<leader>wa' , ':wqa!<CR><C-w><C-q>' )
  nmap ( '<leader>ws' , ':split<CR><C-w><C-w>' )
  nmap ( '<leader>wv' , ':vsplit<CR><C-w><C-w>' )

  nmap ( '<leader>wS' , '<C-W>t<C-w>K' )
  nmap ( '<leader>wV' , '<C-W>t<C-w>H' )

  nmap ( '<leader>wK' , ':resize +5<CR>' )
  nmap ( '<leader>wJ' , ':resize -5<CR>' )
  nmap ( '<leader>wH' , ':vertical resize -5<CR>' )
  nmap ( '<leader>wL' , ':vertical resize +5<CR>' )
end

function K.quit()
  -- Quitting
  nmap ( '<leader>qq' , ':qa!<CR>'  )
  nmap ( '<leader>qa' , ':qa!<CR>'  )
  nmap ( '<leader>qw' , ':wq!<CR>'  )
  nmap ( '<leader>qd' , ':wqa!<CR>' )
end

function K.netrw()
  nmap ( '<space>dd' , ':Lexplore<CR>')
end

function K.optional()
  -- nmap ( '<C-a>', ":y+<CR>" )
  nmap ( '<C-a>', "ggVG<CR>" )
end

function K.help()
 nmap ('<leader>he', ':help ')
 nmap ('<leader>ho', ':help options<CR>')
 nmap ('<leader>rr', ':so %<CR>')

end


--  PACKER:

function K.packer()
  nmap ( '<leader>pi', ':PackerInstall<CR>' )
  nmap ( '<leader>ps', ':PackerSync<CR>' )
  nmap ( '<leader>pc', ':PackerCompile<CR>' )
  nmap ( '<leader>pC', ':PackerClean<CR>' )
end

function K.dashboard()
  nmap ( '<leader>od', ':Dashboard<CR>' )
end

--  PLUGIN:

function K.files()
  nmap ( '<leader>fP', ':e ~/.config/nvim/lua/plugin.lua<CR>' )
  nmap ( '<leader>fm', ':e ~/.config/nvim/lua/core/motion.lua<CR>' )
end

function K.telescope()
  local TEL_EX = ":silent! lua require('telescope').extensions."
  local TEL_MO = ":silent! lua require('modules.plugin.fuzzy.telescope')."

  nmap ( '<leader>;' , ':silent! Telescope commands<CR>' )
  nmap ( '<leader>bb', ':silent! Telescope buffers<CR>' )

  -- NOTE  : Telescope Colorscheme
  nmap ( '<leader>ht', ':silent! Telescope colorscheme<CR>' )
  nmap ( '<leader>hi', ':silent! Telescope highlights<CR>' )
  nmap ( '<leader>hT', ':silent! TodoTrouble cwd=~/.config/nvim<CR>' )

  nmap ( '<leader>J', ':silent! Telescope zoxide list<CR>' )

  -- NOTE  : Telescope Find Files
  nmap ( '<C-g>'     , TEL_MO .. 'search_all()<cr>'       )
  nmap ( '<leader>fa', TEL_MO .. 'search_all()<cr>'       )
  nmap ( '<leader>fW', TEL_MO .. 'search_pics()<cr>'      )
  nmap ( '<leader>fw', TEL_MO .. 'wall_selector()<cr>'    )
  nmap ( '<leader>fv', TEL_MO .. 'search_dotnvim()<cr>'   )
  nmap ( '<leader>fp', TEL_MO .. 'search_dotnvim()<cr>'   )
  nmap ( '<leader>fd', TEL_MO .. 'search_dotfiles()<cr>'  )
  nmap ( '<leader>fx', TEL_MO .. 'search_packer()<CR>'    )
  nmap ( '<leader>fs', TEL_EX .. 'ultisnips.ultisnips{}<cr>' )
  nmap ( '<leader>fg', TEL_EX .. 'fzf_writer.staged_grep()<CR>' )

  nmap ( '<leader>ff', ':silent! lua DotProject{}<CR>' )
  nmap ( '<leader><CR>', ':silent! lua DotProject{}<CR>' )

  nmap ( '<leader>fr', ':silent! Telescope oldfiles<CR>' )
  nmap ( '<leader>fb', ':silent! Telescope buffers<CR>' )
  nmap ( '<leader>fh', ':silent! Telescope builtin<CR>' )
  nmap ( '<leader>fj', ':silent! Telescope zoxide list<CR>' )
  nmap ( '<leader>fl', ':silent! Telescope openbrowser list<CR>' )

  nmap ( '<leader>ft', ':silent! TodoTelescope<CR>' )

  -- nmap ( '<leader>pc', TEL_MO .. "search_dotconfig()<cr>"  )
  nmap ( '<leader>pp', ':silent! lua DotProject{}<CR>' )

  nmap ( '<leader>sp', TEL_EX .. "packer.plugins(opts)<CR>" )

  nmap ( '<leader>vt', ':silent! TodoTelescope cwd=~/.config/nvim<CR>' )

  -- NOTE  : Telescope Org
  nmap ( '<leader>no', TEL_MO .. "search_roam()<CR>"  )
  nmap ( '<leader>nr', TEL_MO .. "search_roam()<CR>"  )
  nmap ( '<leader>nt', ':silent! TodoTelescope cwd='..require'core'.directories.orgroam..'<CR>' )
end

function K.nvimfzf()
  nmap ( -- Open Fzf Projectionist
    '<leader><CR>',
    ':silent! Project<CR>'
  )
  nmap ( '<leader>pp', ':silent! lua fzf_projectionist{}<CR>' )

  nmap ( -- Open All files through /home/user
    '<leader>fa',
    ":silent! lua require('fzf-lua').files({cwd = '~'})<CR>"
  )

  nmap ( '<leader>fw', ':silent! Wallpaper<CR>' )
  nmap ( '<leader>fW', ':silent! Autowallpaper<CR>' )
  nmap ( '<leader>fp', ':silent! Vimconfig<CR>' )
  nmap ( '<leader>fd', ':silent! lua fzf_dotfiles{}<CR>' )
  nmap ( '<leader>ff', ":silent! lua require('fzf-lua').files()<CR>" )
  nmap ( '<space><space>', ":silent! lua require('fzf-lua').files()<CR>" )

  nmap ( '<leader>fr', ":silent! lua require('fzf-lua').oldfiles()<CR>" )

  nmap ( '<leader>fg', ":silent! lua require('fzf-lua').live_grep()<CR>" )
  nmap ( '<leader>bb', ":silent! lua require('fzf-lua').buffers()<CR>" )
  nmap ( '<leader>fb', ":silent! lua require('fzf-lua').buffers()<CR>" )
  nmap ( '<leader>/' , ":silent! lua require('fzf-lua').live_grep()<CR>" )

  nmap ( '<leader>fh', ":silent! lua require('fzf-lua').help_tags()<CR>" )
  nmap ( '<leader>fM', ":silent! lua require('fzf-lua').man_pages()<CR>" )

  nmap ( '<leader>ht', ":silent! lua require('fzf-lua').colorschemes()<CR>" )

  nmap ( '<leader>no', ':silent! lua fzf_orgmode{}<CR>' )
  nmap ( '<leader>nr', ':silent! lua fzf_orgmode{}<CR>' )
  nmap ( '<leader>nd', ":silent! e " .. ROAM .. '/notebook.org<cr>' )

  nmap ( '<leader>sb', ':silent! lua fzf_searchinbuffer{}<CR>' )
  nmap ( '<leader>sp', ':silent! lua fzf_searchinproject{}<CR>' )

  nmap ( '<C-p>'     , ':silent! lua fzf_projectionist{}<CR>' )
  nmap ( '<leader>fc', ':silent! Cheat<CR>' )

  --  NOTE  : Lsp
  nmap ( '<leader>lt', ':lua require"fzf-lua".lsp_typedefs()<cr>' )
  nmap ( '<leader>lr', ':lua require"fzf-lua".lsp_references()<cr>' )
  nmap ( '<leader>lh', ':lua require"fzf-lua".lsp_definitions()<cr>' )
  nmap ( '<leader>ls', ':lua require"fzf-lua".lsp_workspace_symbols()<cr>' )
end

function K.lspsaga()
  nmap ( 'gh'   , ':Lspsaga lsp_finder<CR>' )
  nmap ( '<C-j>', ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>" )
  nmap ( '<C-k>', ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>" )
  nmap ( '<leader>ca', ':Lspsaga code_action<CR>' )
  vmap ( '<leader>ca', ':C-U>Lspsaga range_code_action<CR>' )
  nmap ( '<leader>hh', ':Lspsaga hover_doc<CR>' )
end

function K.floaterm()
  local TFLOAT = ':FloatermNew --height=0.9 --width=0.6 --wintype=float '
  nmap ('<leader>.', ":FloatermNew ranger<CR>" )
  nmap ('<leader>oo', TFLOAT .. "<cr>" )
  nmap ('<leader>og', TFLOAT .. "lazygit<CR>" )

end

function K.hop()
  nmap ( '<C-f>',':HopChar1<cr>' )
  nmap ("<leader>gj", ':HopLine<cr>' )
  nmap ("<leader>gk", ':HopLine<cr>' )
  nmap ("<leader>gw", ':HopWord<cr>' )
end

function K.nvimtree()
  nmap ( '<leader>dd',':silent lua GoCwd{}<cr>' )
  nmap ( '<leader>df',':silent NvimTreeToggle<cr>' )
end

function K.zen()
  nmap ( '<leader>go',':silent TZAtaraxis<cr>' )
  nmap ( '<leader>gg',':silent TZMinimalist<cr>' )
end

function K.compe()
  local map = vim.api.nvim_set_keymap
  local expr = { expr = true }
  -- map('i', '<Tab>', 'v:lua.tab_complete()', expr )
  -- map('s', '<Tab>', 'v:lua.tab_complete()', expr )
  -- map('i', '<S-Tab>', 'v:lua.s_tab_complete()', expr )
  -- map('s', '<S-Tab>', 'v:lua.s_tab_complete()', expr )
  -- map('i', '<CR>', "compe#confirm({'keys': '<CR>', 'select': v:true })", expr )
  -- map('i', '<c-space>', 'compe#complete()', expr )
  map('i', '<Tab>', 'pumvisible() ? "\\<C-y>" : "\\<Tab>"', expr)
  map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', expr )
end

for _, keymap in pairs(Keymaps) do K[keymap]() end
