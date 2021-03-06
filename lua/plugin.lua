local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

local packer = require('packer')

packer.init({
  git = {
    clone_timeout = 600
  },
})

vim.cmd [[packadd packer.nvim]]
local use = packer.use
return require('packer').startup(function()


    use ({  -- The Essentials
            -- whatever you need

            'wbthomason/packer.nvim',
            event = 'VimEnter',
            requires = {
              { 'kyazdani42/nvim-web-devicons' },
              { 'lambdalisue/suda.vim',
                config =
                    vim.cmd ([[
                      let g:suda_smart_edit = 1
                      nnoremap <leader>sW :SudaWrite<cr>
                      nnoremap <leader>sR :SudaRead<cr>
                    ]])
              },
              { 'svermeulen/vimpeccable' },
              { 'jdhao/better-escape.vim',
                config = vim.cmd([[
                  let g:better_escape_shortcut = ['jk', 'kj']
                ]])
              },
            }

    })


    use ({  -- The Translator
            -- translate langauge through parsers

            'neovim/nvim-lspconfig',
            requires = {
              { 'kabouzeid/nvim-lspinstall' },
              { 'mhartington/formatter.nvim' },
              -- { 'tjdevries/astronauta.nvim' },
              { 'hrsh7th/nvim-compe'                , config = require'modules.plugin.compe' },
              { 'mattn/emmet-vim' },
              { 'glepnir/lspsaga.nvim',
                  config = function()
                    require'lspsaga'.init_lsp_saga{
                      code_action_icon = ' ',
                      code_action_prompt = {
                        enable = true;
                        sign = false;
                        virtual_text = true;
                  }} end },
              { 'pearofducks/ansible-vim' },
              { 'SirVer/ultisnips' ,
                config = vim.cmd([[
                  let g:UltiSnipsExpandTrigger="<Tab>"
                  let g:UltiSnipsJumpForwardTrigger="<Tab>"
                  let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
                ]])},
              { 'honza/vim-snippets' },
            },
            config = function ()
              require'modules.plugin.lspconfig'
            end

    })


    use ({  -- The Engulfing Board
            -- integrate user interface

            'glepnir/dashboard-nvim',
            requires =  {
              { 'Shatur/neovim-ayu' },
              { 'Pocco81/TrueZen.nvim' },
              { 'akinsho/nvim-bufferline.lua'     , config = require'modules.plugin.bufferline' },
              { 'nvim-treesitter/nvim-treesitter' , config = require'modules.plugin.treesitter', run = ':TSUpdate'},
              { 'nvim-treesitter/playground'      , disable = true },
              { 'jesseduffield/lazygit' },           -- git through command line
              { 'lewis6991/gitsigns.nvim'         , requires = 'nvim-lua/plenary.nvim' },
              { 'RishabhRD/popfix'                , opt = true , cmd = 'Cheat' },
              { 'RishabhRD/nvim-cheat.sh'         , opt = true , cmd = 'Cheat' },
              ----------- Others -----------
              { 'windwp/nvim-autopairs' },
              { 'norcalli/nvim-colorizer.lua'     , config = require'modules.plugin.others' },
            },
            config = function()
              require'modules.plugin.dashboard'
            end

    })


    use ({  -- The Statusline
            -- colorize your life

            'famiu/feline.nvim',
            requires = {
              { 'kyazdani42/nvim-web-devicons' },
              { 'lambdalisue/battery.vim',
                  config =vim.cmd ([[
                      let g:battery#component_format="%v%%"
                      let g:battery#symbol_charging='  '
                      let g:battery#symbol_discharging='⭘  '
                    ]])}
            },
            config = function()
              require'nvim-web-devicons'.setup{}
              require'modules.plugin.statusline'
            end

    })


    use ({  -- The Moon Seeker
            -- fuzzy finding plantes in outer spaces

            'nvim-telescope/telescope.nvim',
            requires = {
              { "nvim-lua/popup.nvim" },
              { "nvim-lua/plenary.nvim" },
              -- { 'airblade/vim-rooter' },
              -- { 'tyru/open-browser.vim' },
              { 'jvgrootveld/telescope-zoxide' },
            },
            config = function()
              require'modules.plugin.fuzzy.telescope'
            end

    })

    use({  -- The Nixies
           -- language of nixies

           'LnL7/vim-nix',

    })


    use ({  -- The Twin Moon Seeker
            -- fuzzy finding plantes in outer spaces

            'ibhagwan/fzf-lua',
            requires = {
              { 'vijaymarupudi/nvim-fzf' },
              { 'airblade/vim-rooter' },
              { "nvim-lua/popup.nvim" },
              { "nvim-lua/plenary.nvim" },
            },
            config = function()
              require'modules.plugin.fuzzy.fzf'
            end

    })


    use ({  -- The Tome Keeper
            -- notational notebook

            'kristijanhusak/orgmode.nvim',
            requires = {
              { 'folke/todo-comments.nvim'        , config = require'modules.plugin.todo' },
              { 'godlygeek/tabular' },
              { 'vim-pandoc/vim-pandoc-syntax' },
              { 'metakirby5/codi.vim' },
            },
            config = function()
              require'modules.plugin.orgmode'
              vim.cmd([[
                let g:pandoc#syntax#codeblocks#embeds#langs = [ "python", "lua", "bash=sh"]
              ]])
            end

    })


    -- use ({  -- The Catcher
    --         -- separating connection

    --         'AckslD/nvim-revJ.lua',
    --         requires = { 'kana/vim-textobj-user', 'sgur/vim-textobj-parameter' },
    --         config =
    --           require("revj").setup{
    --               brackets = { first = '([{<', last = ')]}>', },
    --               new_line_before_last_bracket = true,
    --               add_seperator_for_last_parameter = true,
    --               enable_default_keymaps = false,
    --               keymaps = { line   = '<Leader>ij', visual = '<Leader>iJ', },
    --           }

    -- })


    use ({  -- The Descriptor
            -- same essentials for motions

            'folke/which-key.nvim',
            requires = {
              { 'gcmt/breeze.vim' },
              { 'tommcdo/vim-lion' },
              { 'kyazdani42/nvim-tree.lua'        , config = require'modules.plugin.nvimtree' },
              { 'voldikss/vim-floaterm',
                config = function()
                  vim.g.floaterm_shell = 'fish'
                  vim.g.floaterm_opener = 'drop'
                  vim.g.floaterm_autoclose = 2
                  vim.g.floaterm_wintype = 'float'
                  vim.g.floaterm_height = 0.8
                  vim.g.floaterm_width = 180
                  vim.cmd'hi FloatermBorder guibg=none'
                end
              },
              { 'phaazon/hop.nvim' },
            },
            config = function()
              require'modules.plugin.whichkey'
              require'core.motion'
            end

    })

    for _, plugin in ipairs(require'core'.modules.plugins) do use(plugin) end
  end
)
