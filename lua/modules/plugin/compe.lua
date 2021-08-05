return function()
  vim.o.completeopt = "menuone,noselect"

  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';

    source = {
      path = true;
      buffer = true;
      calc = true;
      -- vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      ultisnips = true;
      snippets_nvim = true;
      treesitter = true;
      orgmode = true;
      neorg = true;
    };
  }

end

