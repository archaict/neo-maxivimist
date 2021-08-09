local cmd = vim.cmd
local theme = require'colors.ayu'.ayu
local config = require'core'

local none   = 'NONE'
local red    = theme.red
local green  = theme.green
local blue   = theme.blue
local yellow = theme.yellow
local grey   = theme.grey
local l_grey = theme.l_grey
local d_grey = theme.d_grey
local black  = theme.black
local white  = theme.white
local purple = theme.purple
local neovide = '#101010'

local function fg(group, color)
  cmd("au ColorScheme * hi " .. group .. " guifg=" .. color) end
local function bg(group, color)
  cmd("au ColorScheme * hi " .. group .. " guibg=" .. color) end
local function fg_bg(group, fgcol, bgcol)
  cmd("au ColorScheme * hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol) end

fg ( 'Directory' , blue )
fg_bg ( 'Search' , yellow, none )
fg_bg ( "Visual" , l_grey   , d_grey )
fg_bg ( "VertSplit gui=NONE", black, none)
fg_bg ( "Error gui=NONE", red, none)
fg_bg ( "ErrorMsg gui=NONE", red, none)
fg_bg ( "NvimInternalError gui=NONE", red, none)

-- [ Commentary ] ---------------------------------------

if config.highlights.comment == 'italic' then
  cmd "au ColorScheme * hi Comment cterm=italic gui=italic"
end

-- [ Highlights ] ---------------------------------------

bg ( 'CursorLine', black )
bg ( 'ColorColumn', d_grey )

fg_bg ( 'Tabline     gui=none', '#909090', '#14191F' )
fg_bg ( 'TablineFill gui=none', '#909090', none )
fg_bg ( 'TablineSel  gui=none', '#dddddd', '#404040' )

-- [ Transparency ] -------------------------------------

if config.highlights.transparency then

  bg ( 'Normal'     , none )
  bg ( 'Pmenu'      , none )
  bg ( 'SignColumn' , none )
  bg ( 'NormalNC'   , none )
  bg ( 'MsgArea'    , none )
  bg ( 'Folded'     , none )
  bg ( 'EndOfBuffer', none )

  fg ( 'Folded'     , '#707070' )

else

  bg ( 'Normal'     , '#0F1419' )
  bg ( 'Pmenu'      , '#0F1419' )
  bg ( 'SignColumn' , '#0F1419' )
  bg ( 'NormalNC'   , '#0F1419' )
  bg ( 'MsgArea'    , '#0F1419' )
  bg ( 'EndOfBuffer', '#0F1419' )

end

