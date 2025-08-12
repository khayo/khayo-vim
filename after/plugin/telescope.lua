local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {});
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- comentado para guardar como referência
-- vim.keymap.set('n', '<leader>fs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ")});
-- end)

local telescope = require('telescope')

-- Função para listar apenas atalhos customizados
local function my_keymaps()
  builtin.keymaps({
    -- Mostra todos e depois filtra via previewer
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      -- Pressione <CR> para aplicar o filtro só com <leader>
      map('i', '<CR>', function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        picker:refresh(
          require('telescope.finders').new_table {
            results = vim.tbl_filter(function(entry)
              return entry.lhs:find("<leader>") ~= nil
            end, picker.finder.results)
          },
          { reset_prompt = true }
        )
      end)

      return true
    end
  })
end

-- Atalho para abrir lista filtrada
vim.keymap.set('n', '<leader>km', my_keymaps, { desc = "Meus atalhos (<leader>)" })
