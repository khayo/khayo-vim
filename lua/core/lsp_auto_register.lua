local lsp_path = vim.fn.stdpath("data") .. "/mason/share/mason-schemas/lsp"
local uv = vim.loop
local enabled_lsps = {}

local handle = uv.fs_scandir(lsp_path)
if handle then
  while true do
    local name, type = uv.fs_scandir_next(handle)
    if not name then break end
    if type == "file" and name:match("%.json$") then
      local lsp_name = name:gsub("%.json$", "")
      table.insert(enabled_lsps, lsp_name)
    end
  end
end

-- Ativa os LSPs automaticamente
vim.lsp.enable(enabled_lsps)
