return {
  {
    'vim-test/vim-test',
    lazy = false,
    dependencies = {
      -- 'tpope/vim-dispatch',
      {
        'sebdah/vim-delve',
        config = function()
          vim.g['delve_use_vimux'] = 1
        end,
      },
      {
        'preservim/vimux',
        config = function()
          -- vim.g['vimuxorientation'] = 'h'
          -- vim.g['vimuxheight'] = '40%'
        end,
      },
    },
    config = function()
      vim.g['test#strategy'] = 'vimux'
      vim.g['test#go#gotest#options'] = '-v -tags=debug,test,service_tests,system_tests -count=1'
      vim.g['test#go#delve#options'] = '-tags=debug,test,service_tests,system_tests'
      vim.g['test#echo_command'] = 0
      vim.g['test#preserve_screen'] = 1
      vim.g['test#custom_transformations'] = {
        pillar = function(cmd)
          return 'make svctest-harness && grc ' .. cmd
        end,
      }
      vim.g['test#transformation'] = 'pillar'
    end,
      -- stylua: ignore
      keys = {
        { '<leader>tf', '<cmd>TestFile<cr>', desc = '[t]est [f]ile', },
        { '<leader>tt', '<cmd>TestNearest<cr>', desc = '[tt]est nearest', },
        { '<leader>tl', '<cmd>TestLast<cr>', desc = '[t]est [l]ast', },
        { '<leader>tv', '<cmd>TestVisit<cr>', desc = '[t]est [v]isit (go to the last test that ran)', },
        { '<leader>td', '<cmd>DlvTestCurrent --build-flags="-tags=debug,test,service_tests,system_tests"<cr>', desc = 'debug nearest', },
        { '<leader>b', '<cmd>DlvToggleBreakpoint<cr>', desc = 'toggle breakpoint', },
      },
  },
}
