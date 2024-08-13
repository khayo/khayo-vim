return {
    { "nvim-tree/nvim-tree.lua",
        dependencies = {
          "nvim-tree/nvim-web-devicons", lazy = true
        },
    },
    {
        "ziontee113/icon-picker.nvim",
        dependencies = {
            "stevearc/dressing.nvim",
        },
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })

            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
            vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
            vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
        end
    },
    {
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-telescope/telescope.nvim', 
        dependencies = { 'nvim-lua/plenary.nvim' } 
    },
    { 'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate'
    },
    { 'nvim-treesitter/playground' },
    { 'theprimeagen/harpoon'},
    { 'mbbill/undotree'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },
    { 'wakatime/vim-wakatime'},
    { 'numToStr/Comment.nvim'},
    { 'windwp/nvim-ts-autotag' },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    { 'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- terminal integrado
    { "akinsho/toggleterm.nvim" },

    -- fecha automaticamente as tags
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
    {
        "Hoffs/omnisharp-extended-lsp.nvim"
    },
    { -- This plugin
      "Zeioth/compiler.nvim",
      cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
      dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
      opts = {},
    },
    { -- The task runner we use
      "stevearc/overseer.nvim",
      commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
      cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
      opts = {
        task_list = {
          direction = "bottom",
          min_height = 5,
          max_height = 5,
          default_detail = 1
        },
      },
    },
    {
        -- para funcionar precisa instalar o netcoredbg
        -- https://github.com/Samsung/netcoredbg
        -- colocar os arquivos em /usr/local/bin/netcoredbg
        -- rodar chmod 744 * na pasta do netcoredbg
        "mfussenegger/nvim-dap"
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
    }
}
