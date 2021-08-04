-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/macabre/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/macabre/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/macabre/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/macabre/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/macabre/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/ansible-vim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["battery.vim"] = {
    config = { "" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/battery.vim"
  },
  ["better-escape.vim"] = {
    config = { "" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/better-escape.vim"
  },
  ["breeze.vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/breeze.vim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.dashboard\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\ni\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\30modules.plugin.statusline\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  lazygit = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/lazygit"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\23code_action_prompt\1\0\3\venable\2\17virtual_text\2\tsign\1\1\0\1\21code_action_icon\tÔãù \18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/neovim-ayu"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n\0\3\r\0\a\0\21'\3\0\0006\4\1\0\18\6\2\0B\4\2\4H\a\rÄ\a\a\2\0X\t\2Ä'\t\3\0X\n\5Ä\a\a\4\0X\t\2Ä'\t\5\0X\n\1Ä'\t\6\0\18\n\3\0\18\v\t\0\18\f\b\0&\3\f\nF\a\3\3R\aÒL\3\2\0\bÔÑ©\tÔÅ± \fwarning\tÔÅó \nerror\npairs\6 ‡\4\1\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0005\4\4\0=\4\5\0034\4\5\0005\5\6\0>\5\1\0045\5\a\0>\5\2\0045\5\b\0>\5\3\0045\5\t\0>\5\4\4=\4\n\0033\4\v\0=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\26diagnostics_indicator\0\foffsets\1\0\3\rfiletype\vpacker\15text_align\vcenter\ttext\20Plugins manager\1\0\3\rfiletype\fOutline\15text_align\vcenter\ttext\fSymbols\1\0\3\rfiletype\fminimap\15text_align\vcenter\ttext\fMinimap\1\0\3\rfiletype\rNvimTree\15text_align\vcenter\ttext\18File Explorer\20separator_style\1\3\0\0\bÔÖÇ\bÔÖÇ\1\0\v\22max_prefix_length\3\15\20max_name_length\3\20\15close_icon\6 \16diagnostics\rnvim_lsp\18modified_icon\b‚óè\27always_show_bufferline\2\22buffer_close_icon\bÔÄç\19indicator_icon\6 \15text_align\vcenter\fsort_by\aid\rtab_size\3\25\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cheat.sh"] = {
    commands = { "Cheat" },
    loaded = false,
    needs_bufread = false,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/opt/nvim-cheat.sh"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\né\1\0\0\3\0\b\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\0016\0\3\0'\2\a\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\19nvim-autopairs\1\2\0\0\6*\nsetup\14colorizer\frequire\22set termguicolors\bcmd\bvim\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nû\3\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\2B\0\2\1K\0\1\0\vsource\1\0\f\rnvim_lua\2\rnvim_lsp\2\nspell\2\tcalc\2\vbuffer\2\15treesitter\2\forgmode\2\nneorg\2\tpath\2\ttags\2\18snippets_nvim\2\14ultisnips\2\1\0\f\ndebug\1\18documentation\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6o\bvim\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-fzf"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.fuzzy.fzf\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.lspconfig\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nz\0\0\6\0\a\0\0206\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3B\3\1\2&\2\3\2B\0\2\0016\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\5\3'\5\6\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\n%:p:h\vexpand\vgetcwd\afn\bcd \bcmd\bvimj\0\0\3\0\5\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0+\2\2\0B\0\2\1K\0\1\0\14find_file\vSetCwd\frefresh\14nvim-tree\frequireÖ\23\1\0\a\0s\0Ã\0026\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\3\0009\1\4\1'\2\b\0=\2\a\0016\1\3\0009\1\4\0015\2\n\0=\2\t\0016\1\3\0009\1\4\1)\2\1\0=\2\v\0016\1\3\0009\1\4\1)\2\0\0=\2\f\0016\1\3\0009\1\4\1)\2\1\0=\2\r\0016\1\3\0009\1\4\0015\2\15\0=\2\14\0016\1\3\0009\1\4\1)\2\1\0=\2\16\0016\1\3\0009\1\4\1)\2\1\0=\2\17\0016\1\3\0009\1\4\1)\2\1\0=\2\18\0016\1\3\0009\1\4\1)\2\0\0=\2\19\0016\1\3\0009\1\4\1)\2\1\0=\2\20\0016\1\3\0009\1\4\1)\2\1\0=\2\21\0016\1\3\0009\1\4\1'\2\23\0=\2\22\0016\1\3\0009\1\4\1)\2\1\0=\2\24\0016\1\3\0009\1\4\1)\2\0\0=\2\25\0016\1\3\0009\1\4\1)\2\0\0=\2\26\0016\1\3\0009\1\4\1)\2\1\0=\2\27\0016\1\3\0009\1\4\1)\2\1\0=\2\28\0016\1\3\0009\1\4\1)\2\1\0=\2\29\0016\1\3\0009\1\4\1)\2\1\0=\2\30\0016\1\3\0009\1\4\1)\2\1\0=\2\31\0016\1\3\0009\1\4\1)\2\1\0=\2 \0016\1\3\0009\1\4\1'\2\"\0=\2!\0016\1\3\0009\1\4\1)\2\0\0=\2#\0016\1\3\0009\1\4\0015\2%\0005\3&\0>\3\2\0025\3'\0>\3\4\2=\2$\0016\1\3\0009\1\4\0014\2#\0005\3*\0005\4)\0=\4+\3\18\4\0\0'\6,\0B\4\2\2=\4-\3>\3\1\0025\3/\0005\4.\0=\4+\3\18\4\0\0'\0060\0B\4\2\2=\4-\3>\3\2\0025\0031\0\18\4\0\0'\0062\0B\4\2\2=\4-\3>\3\3\0025\0033\0\18\4\0\0'\0064\0B\4\2\2=\4-\3>\3\4\0025\0035\0\18\4\0\0'\0066\0B\4\2\2=\4-\3>\3\5\0025\0037\0\18\4\0\0'\0068\0B\4\2\2=\4-\3>\3\6\0025\0039\0\18\4\0\0'\6:\0B\4\2\2=\4-\3>\3\a\0025\3;\0\18\4\0\0'\6<\0B\4\2\2=\4-\3>\3\b\0025\3=\0\18\4\0\0'\6>\0B\4\2\2=\4-\3>\3\t\0025\3?\0\18\4\0\0'\6@\0B\4\2\2=\4-\3>\3\n\0025\3A\0\18\4\0\0'\6B\0B\4\2\2=\4-\3>\3\v\0025\3C\0\18\4\0\0'\6D\0B\4\2\2=\4-\3>\3\f\0025\3E\0\18\4\0\0'\6F\0B\4\2\2=\4-\3>\3\r\0025\3G\0\18\4\0\0'\6H\0B\4\2\2=\4-\3>\3\14\0025\3I\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\15\0025\3K\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\16\0025\3L\0\18\4\0\0'\6M\0B\4\2\2=\4-\3>\3\17\0025\3N\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\18\0025\3O\0\18\4\0\0'\6P\0B\4\2\2=\4-\3>\3\19\0025\3Q\0\18\4\0\0'\6R\0B\4\2\2=\4-\3>\3\20\0025\3S\0\18\4\0\0'\6T\0B\4\2\2=\4-\3>\3\21\0025\3U\0\18\4\0\0'\6V\0B\4\2\2=\4-\3>\3\22\0025\3W\0\18\4\0\0'\6X\0B\4\2\2=\4-\3>\3\23\0025\3Y\0\18\4\0\0'\6Z\0B\4\2\2=\4-\3>\3\24\0025\3[\0\18\4\0\0'\6\\\0B\4\2\2=\4-\3>\3\25\0025\3]\0\18\4\0\0'\6^\0B\4\2\2=\4-\3>\3\26\0025\3_\0\18\4\0\0'\6`\0B\4\2\2=\4-\3>\3\27\0025\3a\0\18\4\0\0'\6b\0B\4\2\2=\4-\3>\3\28\0025\3c\0\18\4\0\0'\6d\0B\4\2\2=\4-\3>\3\29\0025\3e\0\18\4\0\0'\6f\0B\4\2\2=\4-\3>\3\30\0025\3g\0\18\4\0\0'\6f\0B\4\2\2=\4-\3>\3\31\0025\3h\0\18\4\0\0'\6i\0B\4\2\2=\4-\3>\3 \0025\3j\0\18\4\0\0'\6i\0B\4\2\2=\4-\3>\3!\0025\3k\0\18\4\0\0'\6l\0B\4\2\2=\4-\3>\3\"\2=\2(\0013\1m\0007\1n\0003\1o\0007\1p\0006\1q\0'\3r\0B\1\2\1K\0\1\0á\1au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == \"NvimTree\"  | set laststatus=0 | else | set laststatus=2 | endif\bcmd\nGoCwd\0\vSetCwd\0\16toggle_help\1\0\1\bkey\ag?\1\0\1\bkey\15<leader>dd\nclose\1\0\1\bkey\6q\1\0\1\bkey\t<BS>\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6R\vremove\1\0\1\bkey\6D\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\1\0\1\bkey\6S\frefresh\1\0\1\bkey\6r\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\15close_node\1\0\1\bkey\v<S-CR>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-s>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\23nvim_tree_bindings\1\2\0\0\rterminal\1\3\0\0\vpacker\aqf\1\4\0\0\rfiletype\0\fbuftype$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\26nvim_tree_auto_resize\23nvim_tree_tab_open\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\25nvim_tree_auto_close\24nvim_tree_auto_open\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\b140\20nvim_tree_width\tleft\19nvim_tree_side\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÛ\4\0\0\6\0\20\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3B\1\2\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\18\0005\4\14\0004\5\0\0=\5\15\0045\5\16\0=\5\17\4=\4\19\3B\1\2\1K\0\1\0\15playground\1\0\0\16keybindings\1\0\n\19focus_language\6f\vupdate\6R\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\fdisable\1\0\3\15updatetime\3\25\venable\2\20persist_queries\1\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\19ignore_install\1\2\0\0\tyaml\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nú\1\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0R let g:pandoc#syntax#codeblocks#embeds#langs = [ \"python\", \"lua\", \"bash=sh\"] \bcmd\bvim\27modules.plugin.orgmode\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    commands = { "Cheat" },
    loaded = false,
    needs_bufread = false,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/opt/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["srcery-vim"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/srcery-vim"
  },
  ["suda.vim"] = {
    config = { "" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#modules.plugin.fuzzy.telescope\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nË\n\0\0\a\0J\0w6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\v\0005\5\6\0009\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\r\0009\6\14\0=\6\b\5=\5\15\0045\5\16\0009\6\14\0=\6\b\5=\5\17\0045\5\18\0009\6\14\0=\6\b\5=\5\19\0045\5\20\0009\6\21\0=\6\b\5=\5\22\0045\5\23\0009\6\24\0=\6\b\5=\5\25\0045\5\26\0009\6\27\0=\6\b\5=\5\28\0045\5\29\0009\6\30\0=\6\b\5=\5\31\0045\5 \0009\6\30\0=\6\b\5=\5!\0045\5\"\0009\6\14\0=\6\b\0055\6#\0=\6\n\5=\5$\0045\5%\0009\6\30\0=\6\b\5=\5&\0045\5'\0009\6\a\0=\6\b\5=\5(\0045\5)\0009\6\27\0=\6\b\5=\5*\0045\5+\0009\6\a\0=\6\b\0055\6,\0=\6\n\5=\5-\0045\5.\0009\6\30\0=\6\b\0055\6/\0=\6\n\5=\0050\0045\0051\0009\6\30\0=\6\b\5=\0052\0045\0053\0009\0064\0=\6\b\0055\0065\0=\6\n\5=\0056\0045\0057\0009\0068\0=\6\b\5=\0059\0045\5:\0009\0068\0=\6\b\5=\5;\0045\5<\0009\6\30\0=\6\b\5=\5=\0045\5>\0009\6\14\0=\6\b\5=\5?\0045\5@\0009\6\24\0=\6\b\5=\5A\4=\4B\0035\4C\0004\5\0\0=\5D\4=\4E\0035\4F\0005\5G\0=\5H\4=\4I\3B\1\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fpattern\19\\b(KEYWORDS)\\b\fcommand\arg\14highlight\fexclude\1\0\6\nafter\afg\vbefore\5\17max_line_len\3ê\3\18comments_only\1\fkeyword\twide\fpattern\22.*<(KEYWORDS)\\s*:\rkeywords\vKEYMAP\1\0\1\ticon\tÔãö \vMODULE\1\0\1\ticon\tÔãö \vTHEMES\1\0\1\ticon\tÔãö \vOBSTRC\1\0\1\ticon\tÔãö \tENDS\fcomment\1\0\1\ticon\a  \tNOTE\1\2\0\0\tINFO\fb_white\1\0\1\ticon\tÔ¥¨ \tOPTS\1\0\1\ticon\tÔãö \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔãö \tWARN\1\4\0\0\fWARNING\bXXX\tSTOP\1\0\1\ticon\tÔÅ™ \tQUES\1\0\1\ticon\tÔÅô \tHACK\1\0\1\ticon\tÔíê \tWAIT\1\0\1\ticon\tÔé§ \tPACK\1\5\0\0\vPACKER\tPLUG\vPLUGIN\fPLUGINS\1\0\1\ticon\bÔ®ã\tSECT\1\0\1\ticon\tÔãö \tFILE\vyellow\1\0\1\ticon\bÔ®ã\tHELP\vpurple\1\0\1\ticon\tÔé§ \tDESC\ngreen\1\0\1\ticon\tÔ¥¨ \tDONE\tgrey\1\0\1\ticon\tÔÄå \tTODO\1\0\1\ticon\tÔÄå \tAUTH\1\0\1\ticon\tÔÖã \nVAULT\tblue\1\0\1\ticon\bÔ®ã\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\ncolor\bred\1\0\1\ticon\tÔÜà \1\0\3\19merge_keywords\2\18sign_priority\3\b\nsigns\2\nsetup\18todo-comments\bayu\15colors.ayu\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ultisnips = {
    config = { "" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\2\nà\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0 EasyMotion_use_smartsign_us\26EasyMotion_do_mapping\25EasyMotion_smartcase\6g\bvim\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n∑\5\0\0\3\0\v\1\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\2\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\a\0006\0\0\0009\0\1\0)\1P\0=\1\b\0006\0\0\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0›\3                     nnoremap <silent> <leader>oo :FloatermToggle<CR>\n                     nnoremap <silent> <leader>ot :FloatermToggle<CR>\n                     nnoremap <silent> <leader>or :FloatermNew ranger<CR>\n                     nnoremap <silent> <leader>Gl :FloatermNew lazygit<CR>\n                    \"nnoremap <silent> <leader><leader><Esc> :FloatermToggle<cr>\n                    \"tnoremap <silent> <leader><Esc> <C-\\><C-n>:FloatermToggle<cr>\n                   \bcmd\19floaterm_width\20floaterm_height\nsplit\21floaterm_wintype\23floaterm_autoclose\tdrop\20floaterm_opener\6g\bvimÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/vimpeccable"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\16core.motion\28modules.plugin.whichkey\frequire\0" },
    loaded = true,
    path = "/home/macabre/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\né\1\0\0\3\0\b\0\0166\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\0016\0\3\0'\2\a\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\19nvim-autopairs\1\2\0\0\6*\nsetup\14colorizer\frequire\22set termguicolors\bcmd\bvim\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\nû\3\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\2B\0\2\1K\0\1\0\vsource\1\0\f\rnvim_lua\2\rnvim_lsp\2\nspell\2\tcalc\2\vbuffer\2\15treesitter\2\forgmode\2\nneorg\2\tpath\2\ttags\2\18snippets_nvim\2\14ultisnips\2\1\0\f\ndebug\1\18documentation\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6o\bvim\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: suda.vim
time([[Config for suda.vim]], true)

time([[Config for suda.vim]], false)
-- Config for: nvim-fzf
time([[Config for nvim-fzf]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.fuzzy.fzf\frequire\0", "config", "nvim-fzf")
time([[Config for nvim-fzf]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\23code_action_prompt\1\0\3\venable\2\17virtual_text\2\tsign\1\1\0\1\21code_action_icon\tÔãù \18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#modules.plugin.fuzzy.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nË\n\0\0\a\0J\0w6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\v\0005\5\6\0009\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\r\0009\6\14\0=\6\b\5=\5\15\0045\5\16\0009\6\14\0=\6\b\5=\5\17\0045\5\18\0009\6\14\0=\6\b\5=\5\19\0045\5\20\0009\6\21\0=\6\b\5=\5\22\0045\5\23\0009\6\24\0=\6\b\5=\5\25\0045\5\26\0009\6\27\0=\6\b\5=\5\28\0045\5\29\0009\6\30\0=\6\b\5=\5\31\0045\5 \0009\6\30\0=\6\b\5=\5!\0045\5\"\0009\6\14\0=\6\b\0055\6#\0=\6\n\5=\5$\0045\5%\0009\6\30\0=\6\b\5=\5&\0045\5'\0009\6\a\0=\6\b\5=\5(\0045\5)\0009\6\27\0=\6\b\5=\5*\0045\5+\0009\6\a\0=\6\b\0055\6,\0=\6\n\5=\5-\0045\5.\0009\6\30\0=\6\b\0055\6/\0=\6\n\5=\0050\0045\0051\0009\6\30\0=\6\b\5=\0052\0045\0053\0009\0064\0=\6\b\0055\0065\0=\6\n\5=\0056\0045\0057\0009\0068\0=\6\b\5=\0059\0045\5:\0009\0068\0=\6\b\5=\5;\0045\5<\0009\6\30\0=\6\b\5=\5=\0045\5>\0009\6\14\0=\6\b\5=\5?\0045\5@\0009\6\24\0=\6\b\5=\5A\4=\4B\0035\4C\0004\5\0\0=\5D\4=\4E\0035\4F\0005\5G\0=\5H\4=\4I\3B\1\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fpattern\19\\b(KEYWORDS)\\b\fcommand\arg\14highlight\fexclude\1\0\6\nafter\afg\vbefore\5\17max_line_len\3ê\3\18comments_only\1\fkeyword\twide\fpattern\22.*<(KEYWORDS)\\s*:\rkeywords\vKEYMAP\1\0\1\ticon\tÔãö \vMODULE\1\0\1\ticon\tÔãö \vTHEMES\1\0\1\ticon\tÔãö \vOBSTRC\1\0\1\ticon\tÔãö \tENDS\fcomment\1\0\1\ticon\a  \tNOTE\1\2\0\0\tINFO\fb_white\1\0\1\ticon\tÔ¥¨ \tOPTS\1\0\1\ticon\tÔãö \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔãö \tWARN\1\4\0\0\fWARNING\bXXX\tSTOP\1\0\1\ticon\tÔÅ™ \tQUES\1\0\1\ticon\tÔÅô \tHACK\1\0\1\ticon\tÔíê \tWAIT\1\0\1\ticon\tÔé§ \tPACK\1\5\0\0\vPACKER\tPLUG\vPLUGIN\fPLUGINS\1\0\1\ticon\bÔ®ã\tSECT\1\0\1\ticon\tÔãö \tFILE\vyellow\1\0\1\ticon\bÔ®ã\tHELP\vpurple\1\0\1\ticon\tÔé§ \tDESC\ngreen\1\0\1\ticon\tÔ¥¨ \tDONE\tgrey\1\0\1\ticon\tÔÄå \tTODO\1\0\1\ticon\tÔÄå \tAUTH\1\0\1\ticon\tÔÖã \nVAULT\tblue\1\0\1\ticon\bÔ®ã\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\ncolor\bred\1\0\1\ticon\tÔÜà \1\0\3\19merge_keywords\2\18sign_priority\3\b\nsigns\2\nsetup\18todo-comments\bayu\15colors.ayu\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n\0\3\r\0\a\0\21'\3\0\0006\4\1\0\18\6\2\0B\4\2\4H\a\rÄ\a\a\2\0X\t\2Ä'\t\3\0X\n\5Ä\a\a\4\0X\t\2Ä'\t\5\0X\n\1Ä'\t\6\0\18\n\3\0\18\v\t\0\18\f\b\0&\3\f\nF\a\3\3R\aÒL\3\2\0\bÔÑ©\tÔÅ± \fwarning\tÔÅó \nerror\npairs\6 ‡\4\1\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0005\4\4\0=\4\5\0034\4\5\0005\5\6\0>\5\1\0045\5\a\0>\5\2\0045\5\b\0>\5\3\0045\5\t\0>\5\4\4=\4\n\0033\4\v\0=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\26diagnostics_indicator\0\foffsets\1\0\3\rfiletype\vpacker\15text_align\vcenter\ttext\20Plugins manager\1\0\3\rfiletype\fOutline\15text_align\vcenter\ttext\fSymbols\1\0\3\rfiletype\fminimap\15text_align\vcenter\ttext\fMinimap\1\0\3\rfiletype\rNvimTree\15text_align\vcenter\ttext\18File Explorer\20separator_style\1\3\0\0\bÔÖÇ\bÔÖÇ\1\0\v\22max_prefix_length\3\15\20max_name_length\3\20\15close_icon\6 \16diagnostics\rnvim_lsp\18modified_icon\b‚óè\27always_show_bufferline\2\22buffer_close_icon\bÔÄç\19indicator_icon\6 \15text_align\vcenter\fsort_by\aid\rtab_size\3\25\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÛ\4\0\0\6\0\20\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3B\1\2\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\18\0005\4\14\0004\5\0\0=\5\15\0045\5\16\0=\5\17\4=\4\19\3B\1\2\1K\0\1\0\15playground\1\0\0\16keybindings\1\0\n\19focus_language\6f\vupdate\6R\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\21unfocus_language\6F\fdisable\1\0\3\15updatetime\3\25\venable\2\20persist_queries\1\fmatchup\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\19ignore_install\1\2\0\0\tyaml\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
try_loadstring("\27LJ\2\nà\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0 EasyMotion_use_smartsign_us\26EasyMotion_do_mapping\25EasyMotion_smartcase\6g\bvim\0", "config", "vim-easymotion")
time([[Config for vim-easymotion]], false)
-- Config for: better-escape.vim
time([[Config for better-escape.vim]], true)

time([[Config for better-escape.vim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\nú\1\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0R let g:pandoc#syntax#codeblocks#embeds#langs = [ \"python\", \"lua\", \"bash=sh\"] \bcmd\bvim\27modules.plugin.orgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n∑\5\0\0\3\0\v\1\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\2\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\a\0006\0\0\0009\0\1\0)\1P\0=\1\b\0006\0\0\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0›\3                     nnoremap <silent> <leader>oo :FloatermToggle<CR>\n                     nnoremap <silent> <leader>ot :FloatermToggle<CR>\n                     nnoremap <silent> <leader>or :FloatermNew ranger<CR>\n                     nnoremap <silent> <leader>Gl :FloatermNew lazygit<CR>\n                    \"nnoremap <silent> <leader><leader><Esc> :FloatermToggle<cr>\n                    \"tnoremap <silent> <leader><Esc> <C-\\><C-n>:FloatermToggle<cr>\n                   \bcmd\19floaterm_width\20floaterm_height\nsplit\21floaterm_wintype\23floaterm_autoclose\tdrop\20floaterm_opener\6g\bvimÁÃô≥\6≥ÊÃ˛\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29modules.plugin.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nz\0\0\6\0\a\0\0206\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\4\3B\3\1\2&\2\3\2B\0\2\0016\0\0\0009\0\1\0'\2\2\0006\3\0\0009\3\3\0039\3\5\3'\5\6\0B\3\2\2&\2\3\2B\0\2\1K\0\1\0\n%:p:h\vexpand\vgetcwd\afn\bcd \bcmd\bvimj\0\0\3\0\5\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0+\2\2\0B\0\2\1K\0\1\0\14find_file\vSetCwd\frefresh\14nvim-tree\frequireÖ\23\1\0\a\0s\0Ã\0026\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\3\0009\1\4\1'\2\b\0=\2\a\0016\1\3\0009\1\4\0015\2\n\0=\2\t\0016\1\3\0009\1\4\1)\2\1\0=\2\v\0016\1\3\0009\1\4\1)\2\0\0=\2\f\0016\1\3\0009\1\4\1)\2\1\0=\2\r\0016\1\3\0009\1\4\0015\2\15\0=\2\14\0016\1\3\0009\1\4\1)\2\1\0=\2\16\0016\1\3\0009\1\4\1)\2\1\0=\2\17\0016\1\3\0009\1\4\1)\2\1\0=\2\18\0016\1\3\0009\1\4\1)\2\0\0=\2\19\0016\1\3\0009\1\4\1)\2\1\0=\2\20\0016\1\3\0009\1\4\1)\2\1\0=\2\21\0016\1\3\0009\1\4\1'\2\23\0=\2\22\0016\1\3\0009\1\4\1)\2\1\0=\2\24\0016\1\3\0009\1\4\1)\2\0\0=\2\25\0016\1\3\0009\1\4\1)\2\0\0=\2\26\0016\1\3\0009\1\4\1)\2\1\0=\2\27\0016\1\3\0009\1\4\1)\2\1\0=\2\28\0016\1\3\0009\1\4\1)\2\1\0=\2\29\0016\1\3\0009\1\4\1)\2\1\0=\2\30\0016\1\3\0009\1\4\1)\2\1\0=\2\31\0016\1\3\0009\1\4\1)\2\1\0=\2 \0016\1\3\0009\1\4\1'\2\"\0=\2!\0016\1\3\0009\1\4\1)\2\0\0=\2#\0016\1\3\0009\1\4\0015\2%\0005\3&\0>\3\2\0025\3'\0>\3\4\2=\2$\0016\1\3\0009\1\4\0014\2#\0005\3*\0005\4)\0=\4+\3\18\4\0\0'\6,\0B\4\2\2=\4-\3>\3\1\0025\3/\0005\4.\0=\4+\3\18\4\0\0'\0060\0B\4\2\2=\4-\3>\3\2\0025\0031\0\18\4\0\0'\0062\0B\4\2\2=\4-\3>\3\3\0025\0033\0\18\4\0\0'\0064\0B\4\2\2=\4-\3>\3\4\0025\0035\0\18\4\0\0'\0066\0B\4\2\2=\4-\3>\3\5\0025\0037\0\18\4\0\0'\0068\0B\4\2\2=\4-\3>\3\6\0025\0039\0\18\4\0\0'\6:\0B\4\2\2=\4-\3>\3\a\0025\3;\0\18\4\0\0'\6<\0B\4\2\2=\4-\3>\3\b\0025\3=\0\18\4\0\0'\6>\0B\4\2\2=\4-\3>\3\t\0025\3?\0\18\4\0\0'\6@\0B\4\2\2=\4-\3>\3\n\0025\3A\0\18\4\0\0'\6B\0B\4\2\2=\4-\3>\3\v\0025\3C\0\18\4\0\0'\6D\0B\4\2\2=\4-\3>\3\f\0025\3E\0\18\4\0\0'\6F\0B\4\2\2=\4-\3>\3\r\0025\3G\0\18\4\0\0'\6H\0B\4\2\2=\4-\3>\3\14\0025\3I\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\15\0025\3K\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\16\0025\3L\0\18\4\0\0'\6M\0B\4\2\2=\4-\3>\3\17\0025\3N\0\18\4\0\0'\6J\0B\4\2\2=\4-\3>\3\18\0025\3O\0\18\4\0\0'\6P\0B\4\2\2=\4-\3>\3\19\0025\3Q\0\18\4\0\0'\6R\0B\4\2\2=\4-\3>\3\20\0025\3S\0\18\4\0\0'\6T\0B\4\2\2=\4-\3>\3\21\0025\3U\0\18\4\0\0'\6V\0B\4\2\2=\4-\3>\3\22\0025\3W\0\18\4\0\0'\6X\0B\4\2\2=\4-\3>\3\23\0025\3Y\0\18\4\0\0'\6Z\0B\4\2\2=\4-\3>\3\24\0025\3[\0\18\4\0\0'\6\\\0B\4\2\2=\4-\3>\3\25\0025\3]\0\18\4\0\0'\6^\0B\4\2\2=\4-\3>\3\26\0025\3_\0\18\4\0\0'\6`\0B\4\2\2=\4-\3>\3\27\0025\3a\0\18\4\0\0'\6b\0B\4\2\2=\4-\3>\3\28\0025\3c\0\18\4\0\0'\6d\0B\4\2\2=\4-\3>\3\29\0025\3e\0\18\4\0\0'\6f\0B\4\2\2=\4-\3>\3\30\0025\3g\0\18\4\0\0'\6f\0B\4\2\2=\4-\3>\3\31\0025\3h\0\18\4\0\0'\6i\0B\4\2\2=\4-\3>\3 \0025\3j\0\18\4\0\0'\6i\0B\4\2\2=\4-\3>\3!\0025\3k\0\18\4\0\0'\6l\0B\4\2\2=\4-\3>\3\"\2=\2(\0013\1m\0007\1n\0003\1o\0007\1p\0006\1q\0'\3r\0B\1\2\1K\0\1\0á\1au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == \"NvimTree\"  | set laststatus=0 | else | set laststatus=2 | endif\bcmd\nGoCwd\0\vSetCwd\0\16toggle_help\1\0\1\bkey\ag?\1\0\1\bkey\15<leader>dd\nclose\1\0\1\bkey\6q\1\0\1\bkey\t<BS>\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6R\vremove\1\0\1\bkey\6D\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\1\0\1\bkey\6S\frefresh\1\0\1\bkey\6r\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\15close_node\1\0\1\bkey\v<S-CR>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-s>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\23nvim_tree_bindings\1\2\0\0\rterminal\1\3\0\0\vpacker\aqf\1\4\0\0\rfiletype\0\fbuftype$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\26nvim_tree_auto_resize\23nvim_tree_tab_open\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\1\3\0\0\rstartify\14dashboard\29nvim_tree_auto_ignore_ft\25nvim_tree_auto_close\24nvim_tree_auto_open\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\b140\20nvim_tree_width\tleft\19nvim_tree_side\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: battery.vim
time([[Config for battery.vim]], true)

time([[Config for battery.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\16core.motion\28modules.plugin.whichkey\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)

time([[Config for ultisnips]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\ni\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\30modules.plugin.statusline\nsetup\22nvim-web-devicons\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cheat lua require("packer.load")({'nvim-cheat.sh', 'popfix'}, { cmd = "Cheat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
