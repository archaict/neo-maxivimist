  -- local home = os.getenv('HOME')
  vim.g.start_time = vim.fn.reltime()
  plug = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
  vim.g.dashboard_footer_icon = ' LUA | '
  vim.g.dashboard_custom_header = {
      "                                   ",
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
      "                                   ",
      "          THE MAXIVIMISTS          ",
      "       ---------------------       ",
      "      ::: HYDRA / NVIM ".. plug .." :::      ",
  }
  vim.g.dashboard_custom_footer = {
    ' LUA | NeoVim loaded in ' .. vim.fn.printf(
      '%.4f',
      vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
    ) .. ' seconds',
  }

  -- vim.cmd("hi! dashboardHeader   guifg=#c3e88d")
  -- vim.cmd("hi! dashboardCenter   guifg=#89ddff")
  -- vim.cmd("hi! dashboardShortcut guifg=#c792ea")
  vim.cmd("hi! dashboardFooter   guifg=#fabd2f")

  vim.g.dashboard_preview_file_height = 30
  vim.g.dashboard_preview_file_width = 80
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_section = {

    file_browser = {
      description = {"  File Browser                        SPC f b"},
    command =  ":Telescope file_browser" },

    find_dotfiles = {
      description = {"  Open Personal dotfiles              SPC f d"},
      command = ":lua DotFiles{}" },

    find_file  = {
      description = {"  Find file in current dir            SPC f f"},
      command = ":Telescope find_files" },

    find_file_all  = {
      description = {"  Find all files                      SPC f a"},
      command = ":lua require'telescope.builtin'.find_files{ cwd = '~' }" },

    find_history = {
      description = {"  Recently opened files               SPC f r"},
      command =  ":Telescope oldfiles" },

    find_pgrep = {
      description = {"  Search and Grep                     SPC f w"},
      command = ":Telescope live_grep" },

    find_project = {
      description = {"  Open Project Directories            SPC p p"},
      command = ":lua DotProject{}" },

    go_colorscheme = {
      description = {"  Change ColorScheme                  SPC h t"},
      command = ":Telescope colorscheme" },

    last_session = {
      description = {"  Recently saved session              SPC s l"},
      command =  ":SessionLoad" },

    lost_hope= {
      description = {"  Our last hope                       SPC f c"},
      command = ":CheatList" },

  }
