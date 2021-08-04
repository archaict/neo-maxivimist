return function()
  require('bufferline').setup({
    options = {
      indicator_icon = ' ',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = ' ',
      max_name_length = 20,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 25,
      separator_style = { '', '', },
      sort_by = 'id',
      text_align = 'center',
      offsets = {
        { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center', },
        { filetype = 'minimap', text = 'Minimap', text_align = 'center', },
        { filetype = 'Outline', text = 'Symbols', text_align = 'center', },
        { filetype = 'packer', text = 'Plugins manager', text_align = 'center', },
      },
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diagnostics_dict)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or "")
          s = s .. sym .. n
        end
        return s
      end
    },
  })
end
