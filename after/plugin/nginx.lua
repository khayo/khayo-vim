required'lspconfig'.nginx_ls.setup({
    cmd = { "nginx-language-server" },  -- Certifique-se de que o comando está no PATH
    filetypes = { "nginx" },
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
  })
