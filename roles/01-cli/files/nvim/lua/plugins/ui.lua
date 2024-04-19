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

      local kset = vim.keymap.set
      local kopts = { noremap = true, silent = true }

      -- move to previous/next
      kset('n', '<A-,>', ':BufferPrevious<CR>', kopts)
      kset('n', '<A-.>', ':BufferNext<CR>', kopts)
      -- Re-order to previous/next
      kset('n', '<A-C-,>', ':BufferMovePrevious<CR>', kopts)
      kset('n', '<A-C-.>', ' :BufferMoveNext<CR>', kopts)
      -- Close buffer
      kset('n', '<A-c>', ':BufferClose<CR>', kopts)
      -- Pin buffer
      kset('n', '<A-p>', ':BufferPin<CR.', kopts)
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
    config = function(_, opts)
      require('gruvbox').setup(opts)

      vim.cmd('colorscheme gruvbox')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
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
  {
    'nvim-tree/nvim-tree.lua',
    keys = function(_, keys)
      local api = require("nvim-tree.api")
      return {
        { "<C-n>",         api.tree.focus, silent = true, desc = 'open nvim-tree' },
        { "<leader><C-n>", api.tree.close, silent = true, desc = 'close nvim-tree' },
      }
    end,
    opts = {
      view = {
        relativenumber = true,
        width = 40,
      }
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = '*',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          -- make this lazy?
          require("telescope").load_extension("fzf")
        end
      }
    },
    keys = function(_, keys)
      local ts = require('telescope.builtin')

      return {
        { '<leader>ff', ts.find_files,      silent = true },
        { '<leader>fr', ts.live_grep,       silent = true },
        { '<leader>fb', ts.buffers,         silent = true },
        { '<leader>fd', ts.lsp_definitions, silent = true },
        { '<leader>fg', ts.git_files,       silent = true },
      }
    end,
    opts = function(_, opts)
      local actions = require("telescope.actions")

      return {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            }
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          }
        },
        pickers = {
          lsp_references = { theme = 'dropdown' },
          lsp_code_actions = { theme = 'dropdown' },
          lsp_definitions = { theme = 'dropdown' },
          lsp_implementations = { theme = 'dropdown' },
          buffers = {
            sort_lastused = true,
            previewer = false,
            theme = 'dropdown',
          },
          find_files = {
            find_command = { "rg", "--files", "--follow" },
          },
          git_files = { theme = 'dropdown' },
          live_grep = { theme = 'dropdown' },
        }
      }
    end,
  }
}
