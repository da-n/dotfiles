return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },

  keys = function()
    local harpoon = require 'harpoon'
    -- stylua: ignore
        local keys = {
            { '<leader>aa', function() harpoon:list():add() end, desc = 'H[a]rpoon File', },
            { '<leader>aq', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Harpoon [q]uick Menu',
          },
        }
    for i = 1, 9 do
           -- stylua: ignore
          table.insert(keys, { '<leader>' .. i, function() require('harpoon'):list():select(i) end, })
    end
    return keys
  end,
}
