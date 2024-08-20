return {
    { 'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', lazy = true
        },
    },
    {
        'ziontee113/icon-picker.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
        },
        config = function()
            require('icon-picker').setup({ disable_legacy_commands = true })
        end
    },
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
           vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-treesitter/playground'
    },
    {
        'theprimeagen/harpoon'
    },
    {
        'mbbill/undotree'
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp'
    },
    {
        'wakatime/vim-wakatime'
    },
    {
        'numToStr/Comment.nvim'
    },
    {
        'windwp/nvim-ts-autotag'
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- terminal integrado
    {
        'akinsho/toggleterm.nvim'
    },

    -- fecha automaticamente as tags
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp'
    },
    {
        'Hoffs/omnisharp-extended-lsp.nvim'
    },
    {
        'puremourning/vimspector',
        init = function()
          vim.g.vimspector_enable_mappings = 'HUMAN'
        end,
    },
    { -- This plugin
        'Zeioth/compiler.nvim',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo'},
        dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
        opts = {},
    },
    { -- The task runner we use
        'stevearc/overseer.nvim',
        commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
        opts = {
            task_list = {
                direction = 'bottom',
                min_height = 25,
                max_height = 25,
                default_detail = 1
            }
        }
    }
}
