vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
cmd("autocmd FileType norg nnoremap <buffer> <C-o> :lua require'telescope.builtin'.find_files({ cwd = " .. require'core'.directories.neorg .. " })<CR>")
