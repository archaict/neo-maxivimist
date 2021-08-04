-- statusline.lua
-- ctermbg thingy is still wonky, please use this in terminal
-- that support xterm-256color or  terminal like kitty and
-- alacritty for better performance otherwise, change the
-- value or disable this completely! --> lua/core/module.lua

vim.cmd([[

leg:currentmode = { 'n': '  NORMAL ', 'no': '  N·OP·PEND', 'v': '  VISUAL', 'V': '  V·LINE ', "\<C-V>": '  V·BLOCK', 's': '  SELECT ', 'S': '  S·LINE ', '�': '  S·BLOCK', 'i': '  INSERT ', 'R': '  REPLACE', 'Rv': '  V·REPLACE', 'c': '  COMMAND', 'cv': '  VIM EX', 'ce': '  EX     ', 'r': '  PROMPT', 'rm': '  MORE   ', 'r?': '  CONFIRM', '!': '  SHELL  ', 't': '  TERMINAL'}
leg:modegroups = { 'n': 'NRM', 'no': 'NRM', 'v': 'VIS', 'V': 'VIS', "\<C-V>": 'VIS', 's': 'OTH', 'S': 'OTH', '�': 'OTH', 'i': 'INS', 'R': 'INS', 'Rv': 'INS', 'c': 'OTH', 'cv': 'OTH', 'ce': 'OTH', 'r': 'OTH', 'rm': 'OTH', 'r?': 'OTH', '!': 'OTH', 't': 'OTH'}

fution! Modetheme(group)
  if g:modegroups[mode()]==a:group
    let g:colthm = g:currentmode[mode()]
    let g:lineModes = g:colthm
    return "  ".g:lineModes." "
  else
    return ''
  endif
endfunction

  set statusline=
     "- LEFT SIDE ----------------------------------"
     "set statusline +=%1*\ %*      " space
     "set statusline +=%1*         " logo
      set statusline+=%4*%{(Modetheme('NRM'))}
      set statusline+=%5*%{(Modetheme('VIS'))}
      set statusline+=%6*%{(Modetheme('INS'))}
      set statusline+=%7*%{(Modetheme('OTH'))}
     "----------------------------------------------"
     "- file name ----------------------------------"
      set statusline +=%3*\ %*      " space
      set statusline +=%3*::        " chevron left
      set statusline +=%3*\ %*      " space
      set statusline +=%3*[         " chevron left
      set statusline +=%3*\ %*      " space

     "set statusline +=%3*%n        " buffer
     "set statusline +=%3*\ %*      " space
     "set statusline +=%3*\|        " separator
     "set statusline +=%3*\ %*      " space

      set statusline +=%3*%f        " file name
      set statusline +=%3*\ %*      " space

      set statusline +=%3*]         " chevron right
      set statusline +=\ %*         " space
     "----------------------------------------------"
     "- flags --------------------------------------"
      set statusline +=%3*%m        " modified is %m
      set statusline +=%3*%r        " read-only is %r
      set statusline +=%9*\ %*      " space
     "----------------------------------------------"


     "- RIGHT SIDE ---------------------------------"
      set statusline +=%=           " move to the right is %=
      set statusline +=%3*\ %*      " space is \ %*
      set statusline +=%3*[%l,%c]   " line,column number
     "----------------------------------------------"
     "- separator  ---------------------------------"
      set statusline +=%3*\ %*      " space is \ %*
      set statusline +=%3*::        " separator
      set statusline +=%3*\ %*      " space is \ %*
     "----------------------------------------------"
     "- file type  ---------------------------------"
      set statusline +=%7*\ %*      " space is \ %*
      set statusline +=%7*[%Y]      " file type is %Y
      set statusline +=%7*\ %*      " space
     "----------------------------------------------"
     "- separator  ---------------------------------"
      set statusline +=%3*\ %*      " space is \ %*
      set statusline +=%3*::        " separator
      set statusline +=%3*\ %*      " space
     "----------------------------------------------"
     "- percentages  -------------------------------"
      set statusline +=%1*\ %*      " space
      set statusline +=%1*%P        " percentages
      set statusline +=%1*\ %*      " space
     "----------------------------------------------"

  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User1  cterm=None gui=None ctermfg=008 guifg=#303030 guibg=#B8CC52 " FG BLACK  BG GREEN
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User2  cterm=None gui=None ctermfg=008 guifg=#B8CC52 guibg=#303030 " FG GREEN  BG DARK
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User3  cterm=None gui=None ctermfg=008 guifg=#AAAAAA guibg=#303030 " FG WHITE  BG DARK

  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User4  cterm=None gui=None ctermfg=008 guifg=#303030 guibg=#B8CC52 " NORMAL | GREEN
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User5  cterm=None gui=None ctermfg=008 guifg=#303030 guibg=#39BAE6 " VISUAL | VIOLET
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User6  cterm=None gui=None ctermfg=008 guifg=#DDDDDD guibg=#B53032 " INSERT | ORANGE
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User7  cterm=None gui=None ctermfg=007 guifg=#303030 guibg=#E6B450 " OTHERS | YELLOW

  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User8  cterm=None gui=None ctermfg=008 guifg=#303030 guibg=#FF8F40 " ACCENT | ORANGE
  au WinEnter,BufWinEnter,FileType,ColorScheme,SessionLoadPost * hi User9  cterm=None gui=None ctermfg=007 guifg=#121212 guibg=#121212 " STATUSLINE BGCOLOR

]])
