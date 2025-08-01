vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>q2", ':q!<CR>')
vim.keymap.set("n", "<leader>qa", ':qa!<CR>')

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- coloca o cursor no meio da tela quando navego usando ctrl+d e ctrl+u
vim.keymap.set("n", "<C-u>", "<C-d>zz")
vim.keymap.set("n", "<C-i>", "<C-u>zz")

-- colaca o cursor no meio da tela quando faço uma busca
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- impede que o conteúdo do ctrl+c seja substituido pelo conteudo que estava
-- marcado pelo modo visual
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- movimentação entre janelas (panels)
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- navegação entre buffers (tabs)
vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
-- close all buffers
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#|bd#<CR>")

-- abre o file explorer
vim.keymap.set('n', '<leader>e' ,"<cmd>NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>vs' ,"<cmd>vs<CR>")
vim.keymap.set('n', '<leader>vh' ,"<cmd>split<CR>")

-- abre os gerenciadores
vim.keymap.set('n', '<leader>M', "<cmd>Mason<CR>")
vim.keymap.set('n', '<leader>L', "<cmd>Lazy<CR>")

-- LSP
vim.keymap.set({'n', 'x'}, '<F13>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
vim.keymap.set('n', '<F14>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

-- dadbod
vim.keymap.set('n', '<leader>db', '<CMD>DBUI<CR>')
