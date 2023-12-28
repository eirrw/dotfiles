return {
  { 'crispgm/nvim-go', ft = 'go' },
  { 'jakewvincent/mkdnflow.nvim', ft = 'md' },
  {
    'nvim-neorg/neorg',
    version = "6.*",
    build = ":Neorg sync-parsers",
    cmd = "Neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
      }
    },
  },

--  'mboughaba/i3config.vim',
  'rpdelaney/vim-sourcecfg',
  'fladson/vim-kitty',
}
