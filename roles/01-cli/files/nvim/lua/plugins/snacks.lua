---@module 'snacks'
return {
  ---@type LazyPluginSpec
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      --dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      ---@type snacks.picker.Config
      picker = {
        enabled = true,
        sources = {
          files = {
            follow = true
          },
          grep = {
            follow = true
          }
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            }
          }
        }
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      -- stylua: disable
      { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
      { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
      { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
      { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
      { "<leader>f",       function() Snacks.picker.files() end,           desc = "Find Files" },
    }
  },
  {
    "neovim/nvim-lspconfig",
    opts = function ()
    end
  }
}
