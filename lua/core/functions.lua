-- Terminal Function
vim.cmd([[
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
            set nobuflisted
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
]])

-- Terminal Function
vim.cmd([[
    function! ChangeLineNumbering()
    if &number == 0 && &relativenumber == 0
        setlocal number!
        echo "nu:1/rnu:0"
    elseif &number == 1 && &relativenumber == 0
        setlocal relativenumber!
        echo "nu:1/rnu:1"
    elseif &number == 1 && &relativenumber == 1
        setlocal number!
        echo "nu:0/rnu:1"
    else
        setlocal relativenumber!
        echo "nu:0/rnu:0"
    endif
    endfunction
]])

if vim.g.colors_name == 'ayu' then
    vim.cmd 'silent !cat ~/.config/alacritty/ayu.yml > ~/.config/alacritty/colors.yml'
elseif vim.g.colors_name == 'nord' then
    vim.cmd 'silent !cat ~/.config/alacritty/nord.yml > ~/.config/alacritty/colors.yml'
end

-- Private Config
function PrivateConfig()
  vim.cmd('e ~/.config/nvim/init.lua')
end

function ToggleNumber()
  vim.wo.number = not vim.wo.number
end

for _, plug in pairs(require'core'.disabled.plugin) do vim.g["loaded_" .. plug] = 1 end
for _, plug in pairs(require'core'.disabled.builtins) do vim.g["loaded_" .. plug] = 1 end
