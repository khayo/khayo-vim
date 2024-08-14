local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  -- https://github.com/Samsung/netcoredbg
  -- colocar os arquivos em /usr/local/bin/netcoredbg
  -- rodar chmod 744 * na pasta do netcoredbg
  command = '/usr/local/bin/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        local current_dir = vim.fn.getcwd()
        local folder_name = vim.fn.fnamemodify(current_dir, ':t')  -- Obtém o nome da pasta atual
        -- montei o endereço de debug assim, mas pode variar
        local default_path = current_dir .. '/bin/Debug/net8.0/' .. folder_name .. '.dll'

        return vim.fn.input('Path to dll: ', default_path, 'file')
    end,
  },
}
