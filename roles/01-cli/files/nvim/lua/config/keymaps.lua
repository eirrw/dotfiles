-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- additional mappings for git-conflict
map("n", "<leader>gx", "<cmd>GitConflictListQf<cr>", { desc = "Git Conflict: List" })
map("n", "<leader>gr", "<cmd>GitConflictRefresh<cr>", { desc = "Git Conflict: Refresh" })

-- buffers
map("n", "<leader><delete>", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })
