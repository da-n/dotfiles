return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- Optional, for file icons
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
      -- { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
      { '<leader>o', ':Neotree focus<CR>', desc = 'NeoTree focus', silent = true },
      { '<leader>e', ':Neotree git_status<CR>', desc = 'NeoTree git status', silent = true },
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true, -- Show hidden files
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          window = {
            mappings = {
              ['\\'] = 'close_window',
            },
          },
        },
      }
    end,
  },
}

