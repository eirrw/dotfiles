require('themer').setup({
    colorscheme = "gruvbox-material-dark-soft",
    styles = {
        comment = { style = 'italic' },
        ["function"] = { style = 'italic' },
        functionbuiltin = { style = 'italic' },
        variable = { style = 'italic' },
        variableBuiltIn = { style = 'italic' },
        parameter  = { style = 'italic' },
    },
    plugins = {
    	telescope = false,
    }
})
