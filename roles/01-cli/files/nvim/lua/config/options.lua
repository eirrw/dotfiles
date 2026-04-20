-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

local opt = vim.opt

opt.dir = "/tmp" -- swapfiles in /tmp
opt.list = true -- show hidden characters
opt.shiftwidth = 4 -- size of indent
opt.tabstop = 4 -- spaces per tab
