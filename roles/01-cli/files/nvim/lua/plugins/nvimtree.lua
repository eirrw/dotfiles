return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '^1',
    keys = {
      { "<C-n>",         "<cmd>NvimTreeFocus<cr>", silent = true, desc = 'open nvim-tree' },
      { "<leader><C-n>", "<cmd>NvimTreeClose<cr>", silent = true, desc = 'close nvim-tree' },
    },
    opts = {
      view = {
        relativenumber = true,
        width = 40,
      }
    }
  },
}
