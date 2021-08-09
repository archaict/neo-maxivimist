vim.cmd "nmap <A-space> za"
vim.cmd "nmap <leader>a <S-Tab>"
vim.cmd "nmap <leader>r zR"
vim.cmd "nmap <leader>m zM"
-- local orgmode = require'core'.directories.orgmode
-- vim.cmd("autocmd FileType org nnoremap <buffer> <C-o> :lua require'telescope.builtin'.find_files({cwd =" .. orgmode .. "})<CR>")
cmd"autocmd FileType org nnoremap <buffer> <leader>T :silent !tangle %<CR>"
