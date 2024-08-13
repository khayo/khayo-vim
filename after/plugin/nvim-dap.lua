local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
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
        local default_path = current_dir .. '/' .. folder_name .. '/bin/Debug/net8.0/' .. folder_name .. '.dll'

        return vim.fn.input('Path to dll', default_path, 'file')
        -- return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
    end,
  },
}
