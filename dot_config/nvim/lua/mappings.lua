require "nvchad.mappings"

local map = vim.keymap.set
local utils = require('modules.utils')
local search_todos = require('modules.search_todos')

-- Insert Mode
--------------------------------------------------------------------------------

map('i', '<A-j>', '<Esc>:move .+1<CR>gi', { desc = "Move current line down" })
map('i', '<A-k>', '<Esc>:move .-2<CR>gi', { desc = "Move current line up" })
map('i', '<C-A-j>', '<Esc>:t .+0<CR>gi', { desc = "Copy current line down" })
map('i', '<C-A-k>', '<Esc>:t .-1<CR>kgi', { desc = "Copy current line up" })

--------------------------------------------------------------------------------

-- Normal Mode
--------------------------------------------------------------------------------

map('n', '<Leader>uw', ':set wrap!<CR>', { desc = 'Toggle line wrap' })
map('n', "<Leader>q", ":q<CR>", { desc = "Horizontal split" })
map('n', "\\", ":split<CR>", { desc = "Horizontal split" })
map('n', "|", ":vsplit<CR>", { desc = "Vertical split" })
map('n', "<Leader>fR", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
map('n', '<leader>fT', search_todos.search_todos_live, { desc = 'Find TODOs' })
map('n', "<Leader>j]", "<cmd>cnext<cr>", { desc = "Jump to next location" })
map('n', "<Leader>j[", "<cmd>cprev<cr>", { desc = "Jump to previous location",  })
map('n', "<leader>e", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file", })
map('n', "<leader>E", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree", })
map('n', "<Leader>fw", "<cmd>lua require('modules.multigrep').multigrep_glob()<CR>", { desc = "Find words in filtered files" })
map('n', "<Leader>w", ":w<CR>", { desc = "Find words in filtered files" })
map('n', 'H', ':bp<CR>', { desc = "Previous buffer" })
map('n', 'L', ':bn<CR>', { desc = "Next buffer" })
map('n', '<Leader>c', ':bd<CR>', { desc = "Delete buffer" })
map('n', '<Leader>bc', ':%bd<CR>', { desc = "Delete all buffers" })
map('n', '<Leader>bC', ':%bd|e#|bd#<CR>', { desc = "Close all buffers except current" })
map('n', '<A-j>', ":MoveLine(1)<CR>", { desc = "Move current line down" })
map('n', '<A-k>', ":MoveLine(-1)<CR>", { desc = "Move current line up" })
map('n', '<C-A-j>', ':t .+0<CR>', { desc = "Copy current line down" })
map('n', '<C-A-k>', ':t .-1<CR>', { desc = "Copy current line up" })
map('n', '<A-l>', 'guee', { desc = "Lowercase word right" })
map('n', '<A-h>', 'gub', { desc = "Lowercase word left" })
map('n', '<C-A-l>', 'gUee', { desc = "Uppercase word right" })
map('n', '<C-A-h>', 'gUb', { desc = "Uppercase word left" })

map('n', "<Leader>y", '', { desc = "Yank/Copy Things" })
map('n', "<Leader>yf", '', { desc = "File Names" })
map('n', "<Leader>yff", ":CopyFileName<CR>", { desc = "Copy current buffer's file name" })
map('n', "<Leader>yfh", ":CopyFileNameHash<CR>", { desc = "Copy current buffer's file name and git hash" })

map('n', '<Leader>g', '', { desc = 'Git Actions' })
map('n', '<Leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset git hunk' })
map('n', '<Leader>gp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview git hunk' })
map('n', ']g', ':Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
map('n', '<Leader>g]', ':Gitsigns next_hunk<CR>', { desc = 'Next git hunk' })
map('n', '[g', ':Gitsigns prev_hunk<CR>', { desc = 'Previous git hunk' })
map('n', '<Leader>g[', ':Gitsigns next_hunk<CR>', { desc = 'Previous git hunk' })
map('n', '<Leader>gl', ':Gitsigns blame_line<CR>', { desc = 'Preview git blame' })
map('n', '<Leader>gL', ':Gitsigns blame<CR>', { desc = 'Open git blame' })
map('n', 'gagh', ':Gitsigns select_hunk<CR>', { desc = 'Select git hunk' })

map('n', '<Leader>=', '<C-w>=', { desc = 'Equalize splits' })
map('n', '<Leader>-', '<C-w>_', { desc = 'Maximize splits' })
map('n', '<Leader>\\', '<C-w>|', { desc = 'Maximize splits' })
map('n', '<C-S-H>', function() utils.smart_resize_horizontal('left', 5) end, { desc = 'Resize split left' })
map('n', '<C-S-L>', function() utils.smart_resize_horizontal('right', 5) end, { desc = 'Resize split right' })
map('n', '<C-S-K>', function() utils.smart_resize_vertical('up', 5) end, { desc = 'Resize split up' })
map('n', '<C-S-J>', function() utils.smart_resize_vertical('down', 5) end, { desc = 'Resize split down' })

map('n', '<Leader>us', ':ToggleStatusLine<CR>', { desc = 'Toggle status line' })

--------------------------------------------------------------------------------

-- Visual Mode
--------------------------------------------------------------------------------

map('v', 'p', '"_dP', { noremap = true, silent = true, desc = 'Paste without overwriting register' })

map('v', '<Tab>', '>gv', { desc = 'Indent selection' })
map('v', '<S-Tab>', '<gv', { desc = 'Unindent selection' })

map('v', '<A-j>', ":MoveBlock(1)<CR>", { desc = "Move current line down" })
map('v', '<A-k>', ":MoveBlock(-1)<CR>", { desc = "Move current line down" })
map('v', '<C-A-j>', ":t '>+0<CR>gv=gv", { desc = "Copy current line down" })
map('v', '<C-A-k>', ":t '<-1<CR>gv=gv", { desc = "Copy current line up" })

--------------------------------------------------------------------------------

map('n', '<leader>o', '', { desc = 'AI Actions' })
map('n', '<leader>oc', ':CodeCompanionChat<CR>', { desc = 'Toggle chat' })
map('n', '<leader>op', ':CodeCompanion ', { desc = 'One shot prompt' })
map('n', '<leader>oa', ':CodeCompanionActions<CR>', { desc = 'Show AI actions' })

-- map('n', '<leader>o', '', { desc = 'AI Tools (Opencode)' })
-- map('n', '<Leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle embedded' })
-- map('n', '<Leader>oa', function() require('opencode').ask('@cursor: ') end, { desc = 'Ask about this' })
-- map('n', '<Leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, {  desc = 'Explain this code' })
-- map('n', '<Leader>on', function() require('opencode').command('session_new') end, { desc = 'New session' })
-- map('n', '<S-C-u>', function() require('opencode').command('messages_half_page_up') end, { desc = 'Messages half page up' })
-- map('n', '<S-C-d>', function() require('opencode').command('messages_half_page_down') end, { desc = 'Messages half page down' })
-- map('n', '<Leader>os', function() require('opencode').select() end, { desc = 'Select prompt' })
--
--                     ['<leader>oa'] = { function() require('opencode').ask('@selection: ') end, desc = 'Ask about selection' },
--                     ['<leader>o+'] = { function() require('opencode').prompt('@buffer', { append = true }) end, desc = 'Add buffer to prompt' },
--                     ['<leader>os'] = { function() require('opencode').select() end, desc = 'Select prompt' },
