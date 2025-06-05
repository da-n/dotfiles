return {
  'github/copilot.vim',
  event = 'InsertEnter', -- Lazy-load Copilot when entering Insert mode
  config = function()
    -- Optional: Custom keymap for accepting suggestions
    vim.cmd [[
      imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    ]]

    -- Optional: Disable Copilot for specific filetypes
    vim.g.copilot_filetypes = {
      ['TelescopePrompt'] = false,
      ['dap-repl'] = false,
      ['markdown'] = true, -- example: enable for markdown
    }
  end,
}
