local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = {
        'bash',
        'c',
        'go',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'python',
        'rust',
        'toml',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = {enable = true}
}
