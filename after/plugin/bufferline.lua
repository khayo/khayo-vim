require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            }
        },
        diagnostics = "nvim_lsp",
        separator_style = 'slant'
    }
}

