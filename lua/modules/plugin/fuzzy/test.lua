function setautowallpaper()
  local fzf = require("fzf").fzf
  local action = require "fzf.actions".action

  coroutine.wrap(function()
    local preview_function = action(function (args)
      if args then
        local wall = args[1]
        vim.cmd("silent !feh --bg-fill " .. wall)
      end
    end)
    local choice = fzf('fd . ~/Pictures -e png -e jpg', "--preview=" .. preview_function .. " --preview-window right:0")
    if choice then
      vim.cmd('silent !feh --bg-fill ' .. choice[1])
    end

  end)()
end
