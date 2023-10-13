local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = {
        'bash',
        'c',
        'fish',
        'go',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'rasi',
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
    highlight = {enable = true}
}
