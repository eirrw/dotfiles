return {
  'romgrk/barbar.nvim',                           -- buffer bar
  { 'nvim-tree/nvim-web-devicons', lazy = true }, -- supporting icon
  { 'lewis6991/gitsigns.nvim',     lazy = true },
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
    keys = function (_, keys)
      local api = require("nvim-tree.api")
      return {
        {"<C-n>", api.tree.focus, silent = true, desc = 'open nvim-tree' },
        {"<leader><C-n>", api.tree.close, silent = true, desc = 'close nvim-tree' },
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
    opts =  function(_, opts)
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
