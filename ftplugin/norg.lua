cmd("autocmd FileType norg nnoremap <buffer> <C-o> :lua require'telescope.builtin'.find_files({ cwd = " .. require'core'.directories.neorg .. " })<CR>")
