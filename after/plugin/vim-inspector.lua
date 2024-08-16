-- Mapeamento no modo normal para inspecionar o valor da palavra sob o cursor
vim.api.nvim_set_keymap('n', '<Leader>di', '<cmd>VimspectorBalloonEval<cr>', { noremap = false, silent = true })

-- Mapeamento no modo visual para inspecionar o valor do texto selecionado
vim.api.nvim_set_keymap('x', '<Leader>di', '<cmd>>VimspectorBalloonEval<cr>', { noremap = false, silent = true })

-- Subir no stack frame (quadro de pilha) com F11
vim.api.nvim_set_keymap('n', '<Leader><F11>', '<cmd>VimspectorUpFrame<cr>', { noremap = false, silent = true })

-- Descer no stack frame (quadro de pilha) com F12
vim.api.nvim_set_keymap('n', '<Leader><F12>', '<cmd>VimspectorDownFrame<cr>', { noremap = false, silent = true })

-- Gerenciar breakpoints
vim.api.nvim_set_keymap('n', '<Leader>B', '<cmd>VimspectorBreakpoints<cr>', { noremap = false, silent = true })

-- Desassemblar código
vim.api.nvim_set_keymap('n', '<Leader>D', '<cmd>VimspectorDisassemble<cr>', { noremap = false, silent = true })

vim.api.nvim_set_keymap('n', '<Leader><F3>', '<cmd>VimspectorReset<cr>', { noremap = false, silent = true })
