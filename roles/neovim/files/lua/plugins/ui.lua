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
      local kset = vim.keymap.set
      require("barbar").setup(opts)

      -- barbar
      local kopts = { silent = true }
      -- move to previous/next
      kset('n', '<A-,>', ':BufferPrevious<CR>', vim.tbl_extend("force", kopts, { desc = 'switch to previous buffer' }))
      kset('n', '<A-.>', ':BufferNext<CR>', vim.tbl_extend("force", kopts, { desc = 'switch to next buffer' }))
      -- Re-order to previous/next
      kset('n', '<A-<>', ':BufferMovePrevious<CR>', kopts)
      kset('n', '<A->>', ' :BufferMoveNext<CR>', kopts)
      -- Goto buffer in position...
      kset('n', '<A-1>', ':BufferGoto 1<CR>', kopts)
      kset('n', '<A-2>', ':BufferGoto 2<CR>', kopts)
      kset('n', '<A-3>', ':BufferGoto 3<CR>', kopts)
      kset('n', '<A-4>', ':BufferGoto 4<CR>', kopts)
      kset('n', '<A-5>', ':BufferGoto 5<CR>', kopts)
      kset('n', '<A-6>', ':BufferGoto 6<CR>', kopts)
      kset('n', '<A-7>', ':BufferGoto 7<CR>', kopts)
      kset('n', '<A-8>', ':BufferGoto 8<CR>', kopts)
      kset('n', '<A-9>', ':BufferGoto 9<CR>', kopts)
      kset('n', '<A-0>', ':BufferLast<CR>', kopts)
      -- Close buffer
      kset('n', '<A-c>', ':BufferClose<CR>', kopts)
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
    'ThemerCorp/themer.lua',
    opts = {
      colorscheme = "gruvbox-material-dark-soft",
      styles = {
        comment         = { style = 'italic' },
        ["function"]    = { style = 'italic' },
        functionbuiltin = { style = 'italic' },
        variable        = { style = 'italic' },
        variableBuiltIn = { style = 'italic' },
        parameter       = { style = 'italic' },
      },
      plugins = {
        telescope = false,
      }
    }
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
          find_files = { theme = 'dropdown' },
          git_files = { theme = 'dropdown' },
          live_grep = { theme = 'dropdown' },
        }
      }
    end,
  }
}
