return {
    {
        'romgrk/barbar.nvim',
        version = '*',
        dependencies = {
            'nvim-web-devicons',
            'gitsigns.nvim',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            sidebar_filetypes = {
                NvimTree = true
            },
            icons = {
                buffer_index = false,
                buffer_number = false,
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                    [vim.diagnostic.severity.WARN] = { enabled = false },
                    [vim.diagnostic.severity.INFO] = { enabled = false },
                    [vim.diagnostic.severity.HINT] = { enabled = true },
                },
                gitsigns = {
                    added = { enabled = true, icon = '+' },
                    changed = { enabled = true, icon = '~' },
                    deleted = { enabled = true, icon = '-' },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
            },
        },
        config = function(_, opts)
            require("barbar").setup(opts)
            local map = function (lhs, rhs)
              vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true })
            end

            -- move to previous/next
            map('<A-,>', ':BufferPrevious<CR>')
            map('<A-.>', ':BufferNext<CR>')
            -- Re-order to previous/next
            map('<A-C-,>', ':BufferMovePrevious<CR>')
            map('<A-C-.>', ' :BufferMoveNext<CR>')
            -- Close buffer
            map('<A-c>', ':BufferClose<CR>')
            -- Pin buffer
            map('<A-p>', ':BufferPin<CR>')
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
    },
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1001,
        opts = {
            terminal_colors = true,
            transparent_mode = true,
        },
        config = function(_, opts)
            require('gruvbox').setup(opts)

            vim.cmd('colorscheme gruvbox')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'gruvbox-material'
            },
            sections = {
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    }
                }
            }
        }
    },
    -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    dependencies = {
        'nvim-web-devicons',
        'mini.icons',
    },
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      spec = {
        {
          mode = { "n", "v" },
          { "<leader><tab>", group = "tabs" },
          { "<leader>c", group = "code" },
          { "<leader>d", group = "debug" },
          { "<leader>dp", group = "profiler" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>s", group = "search" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          { "ga", group = "text-case" },
          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx", desc = "Open with system app" },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps (which-key)",
      },
      {
        "<c-w><space>",
        function()
          require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        desc = "Window Hydra Mode (which-key)",
      },
    },
  },
}
