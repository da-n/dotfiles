return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { '-tags=debug,test,service_tests,system_tests' },
              expandWorkspaceToModule = true,
              ['local'] = 'gitlab.com/adalpha/pillar',
              gofumpt = true,
            },
          },
        },
      },
      setup = {},
      inlay_hints = {
        enabled = false,
      },
    },
  }
}
