return function ()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "yaml" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true };
    matchup= { enable = true },
  }

  -- parser_configs.norg = {
  --     install_info = {
  --         url = "https://github.com/vhyrro/tree-sitter-norg",
  --         files = { "src/parser.c" },
  --         branch = "main"
  --     },
  -- }

  require "nvim-treesitter.configs".setup {
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  }

  -- :TSBufEnable {module}         -- enable module on current buffer
  -- :TSBufDisable {module}        -- disable module on current buffer
  -- :TSEnableAll {module} [{ft}]  -- enable module on every buffer. If filetype is specified, enable only for this filetype.
  -- :TSDisableAll {module} [{ft}] -- disable module on every buffer. If filetype is specified, disable only for this filetype.
  -- :TSModuleInfo [{module}]      -- list information about modules state for each filetype

end
