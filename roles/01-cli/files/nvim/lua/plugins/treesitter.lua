return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    build = ':TSUpdate',
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          'bash',
          'c',
          'fish',
          'go',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'rust',
          'toml',
          'typescript',
          'vim',
          'yaml',
        },
        auto_install = false,
        sync_install = false,
        ignore_install = {},
        modules = {},
        highlight = { enable = true }
      })
    end
  }
}
