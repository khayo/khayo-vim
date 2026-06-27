local bordered_float = {
  border = "rounded",
  max_width = 80,
  max_height = 20,
}

local function set_float_highlights()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f1d2e" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#9ccfd8", bg = "#1f1d2e" })
end

set_float_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_float_highlights,
})

vim.diagnostic.config({
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = { 
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, bordered_float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, bordered_float)

local function request_pull_diagnostics(client, bufnr)
  if not client or not client.server_capabilities.diagnosticProvider then
    return
  end

  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return
  end

  client:request(vim.lsp.protocol.Methods.textDocument_diagnostic, {
    textDocument = vim.lsp.util.make_text_document_params(bufnr),
  }, nil, bufnr)
end

vim.lsp.handlers[vim.lsp.protocol.Methods.workspace_diagnostic_refresh] = function(_, _, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return vim.NIL
  end

  vim.schedule(function()
    for _, bufnr in ipairs(vim.lsp.get_buffers_by_client_id(ctx.client_id)) do
      request_pull_diagnostics(client, bufnr)
    end
  end)

  return vim.NIL
end

local pull_diagnostics_group = vim.api.nvim_create_augroup("lsp_pull_diagnostics", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = pull_diagnostics_group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.defer_fn(function()
      request_pull_diagnostics(client, args.buf)
    end, 100)
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = pull_diagnostics_group,
  callback = function(args)
    vim.defer_fn(function()
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
        request_pull_diagnostics(client, args.buf)
      end
    end, 100)
  end,
})
