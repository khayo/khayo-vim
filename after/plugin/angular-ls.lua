require'lspconfig'.angularls.setup{}

local project_library_path = "~/.asdf/shims"
local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}

require'lspconfig'.angularls.setup{
  cmd = cmd,
}
