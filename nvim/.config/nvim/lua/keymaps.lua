-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- Bindings for persistence
-- -- load the session for the current directory
-- vim.keymap.set('n', '<leader>qs', function()
--   require('persistence').load()
-- end, { desc = 'Persistence load the session for the current directory' })

-- -- select a session to load
-- vim.keymap.set('n', '<leader>qS', function()
--   require('persistence').select()
-- end, { desc = 'Persistence select a session to load' })

-- -- load the last session
-- vim.keymap.set('n', '<leader>ql', function()
--   require('persistence').load { last = true }
-- end, { desc = 'Persistence load the last session' })

-- -- stop Persistence => session won't be saved on exit
-- vim.keymap.set('n', '<leader>qd', function()
--   require('persistence').stop()
-- end, { desc = "Persistence stop => session won't be saved on exit" })

-- Bindings to get paths.
local function yank_path(format, with_line)
  local path = vim.fn.expand(format)
  if with_line then
    path = path .. ':' .. vim.fn.line '.'
  end
  vim.fn.setreg('+', path) -- Copy to system clipboard
  print('Yanked: ' .. path)
end

vim.keymap.set('n', '<Leader>rr', function()
  yank_path('%:p:.', false)
end, { desc = 'Yank relative path' })
vim.keymap.set('n', '<Leader>rl', function()
  yank_path('%:p:.', true)
end, { desc = 'Yank relative path + line' })

-- Mimic vim-vinegar method of navigating to parent dir in oil.
-- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- vim: ts=2 sts=2 sw=2 et
