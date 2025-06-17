return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
      -- Or use this instead if you prefer:
      -- { "nvim-tree/nvim-web-devicons" }
    },
    lazy = false, -- recommended: load eagerly
  },
}
