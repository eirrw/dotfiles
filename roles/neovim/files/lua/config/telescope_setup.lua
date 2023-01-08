local map = vim.keymap.set

local silent = { silent = true }
-- Navigate buffers and repos
map('n', '<c-a>', function() require('telescope.builtin').buffers() end, silent)
map('n', '<c-s>', function() require('telescope.builtin').git_files() end, silent)
map('n', '<c-d>', function() require('telescope.builtin').find_files() end, silent)
map('n', '<c-g>', function() require('telescope.builtin').live_grep() end, silent)
map('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, silent)
