return function()
  vim.cmd('set termguicolors')
  require('colorizer').setup{ "*" };
  require('nvim-autopairs').setup()
end
