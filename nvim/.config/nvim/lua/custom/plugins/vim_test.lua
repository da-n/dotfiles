return {
  'vim-test/vim-test',
  lazy = false,
  dependencies = {
    {
      'sebdah/vim-delve',
      config = function()
        vim.g['delve_use_vimux'] = 1
      end,
    },
    {
      'preservim/vimux',
      config = function()
        vim.g['VimuxOrientation'] = 'h'
        vim.g['VimuxHeight'] = '40%'
      end,
    },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#go#gotest#options'] = '-v -tags=debug,test,service_tests,system_tests'
    vim.g['test#go#delve#options'] = '-tags=debug,test,service_tests,system_tests'
    vim.g['test#echo_command'] = 0
    vim.g['test#preserve_screen'] = 1 -- do not clear the screen before executing the test command
    vim.g['test#custom_transformations'] = {
      pillar = function(cmd)
        return 'make svctest-harness && grc ' .. cmd
      end,
    }
    vim.g['test#transformation'] = 'pillar'
  end,
      -- stylua: ignore
      keys = {
        { '<leader>tf', '<CMD>TestFile<CR>', desc = '[t]est [f]ile', },
        { '<leader>tt', '<CMD>TestNearest<CR>', desc = '[tt]est nearest', },
        { '<leader>tl', '<CMD>TestLast<CR>', desc = '[t]est [l]ast', },
        { '<leader>tv', '<CMD>TestVisit<CR>', desc = '[t]est [v]isit (go to the last test that ran)', },
        { '<leader>td', '<CMD>DlvTestCurrent --build-flags="-tags=debug,test,service_tests,system_tests" -test.v<CR>', desc = 'debug nearest', },
        { '<leader>b', '<CMD>DlvToggleBreakpoint<CR>', desc = 'toggle breakpoint', },
        { '<leader>tx', '<CMD>DlvClearAll<CR>', desc = 'clear all breakpoints', },
      },
}
