return function()
local color = require('colors.ayu').ayu
  require("todo-comments").setup {
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX   = { icon = " ", color = color.red     , alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      VAULT = { icon = "廓", color = color.blue   },
      AUTH  = { icon = " ", color = color.blue   },
      TODO  = { icon = " ", color = color.blue   },
      DONE  = { icon = " ", color = color.grey   },
      DESC  = { icon = "ﴬ ", color = color.green  },
      HELP  = { icon = " ", color = color.purple },
      LANG  = { icon = "ﴬ ", color = color.purple },
      FILE  = { icon = "廓", color = color.yellow },
      SECT  = { icon = " ", color = color.yellow },
      PACK  = { icon = "廓", color = color.blue  , alt = { 'PACKER' ,'PLUG' ,'PLUGIN' ,'PLUGINS' }},
      NIXOS = { icon = " ", color = color.blue   },
       -- DEV
      WAIT  = { icon = " ", color = color.yellow },
      HACK  = { icon = " ", color = color.red    },
      QUES  = { icon = " ", color = color.purple },
      WARN  = { icon = " ", color = color.red     , alt = { "WARNING", "XXX", "STOP" } },
      PERF  = { icon = " ", color = color.yellow  , alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      OPTS  = { icon = " ", color = color.yellow },
      NOTE  = { icon = "ﴬ ", color = color.b_white , alt = { "INFO" } },
       -- CORE
      ENDS   = { icon = "  ", color = color.comment},
      OBSTRC = { icon = " ", color = color.comment},
      THEMES = { icon = " ", color = color.yellow},
      MODULE = { icon = " ", color = color.blue},
      KEYMAP = { icon = " ", color = color.green},
    },
    merge_keywords = true,
    highlight = {
      before  = "",
      keyword = "wide",
      after   = "fg",
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = false,
      max_line_len = 400,
      exclude = {},
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS)\b]],
    },
  }
end
