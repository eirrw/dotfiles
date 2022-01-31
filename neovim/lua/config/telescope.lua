local ts = require('telescope')

ts.setup {
    defaults = {

    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
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
        }
    }
}

ts.load_extension('frecency')
ts.load_extension('fzf')
