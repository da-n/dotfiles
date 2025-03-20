return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { '-tags=debug,test,tests,service_tests,system_tests' },
              expandWorkspaceToModule = true,
              ['local'] = 'gitlab.com/adalpha/pillar',
              gofumpt = true,
            },
          },
        },
        marksman = {},
      },
      setup = {},
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
