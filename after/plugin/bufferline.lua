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

vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")


