local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = {
        'bash',
        'c',
        'go',
        'html',
        'json',
        'latex',
        'lua',
        'make',
        'python',
        'toml',
        'vim',
        'yaml',
    },
    highlight = {enable = true}
}
