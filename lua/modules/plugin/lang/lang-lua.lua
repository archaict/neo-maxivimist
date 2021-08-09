require('lspconfig')["sumneko_lua"].setup { on_attach = on_attach, flags = { debounce_text_changes = 150 }}

-- USER = vim.fn.expand('$USER')
-- local sumneko_root_path = '/home/'.. USER ..'/.local/share/nvim/lspinstall/lua'
-- local sumneko_binary ='/home/'.. USER ..'/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  -- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  cmd = { 'lua-language-server', '-E', './main.lua' };
  settings = {
    Lua = {
      runtime     = { version = 'LuaJIT',path = runtime_path },

      diagnostics = {
        globals   = { "hs", "vim", "it", "describe", "before_each", "after_each" },
        disable   = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" }
      },

      workspace   = { library = vim.api.nvim_get_runtime_file("", true), maxPreload = 2000; preloadFileSize = 1000; },
      telemetry   = { enable = false },
    },
      workspace   = { library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
  },
}
