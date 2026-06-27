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
        name = 'rose-pine',
        config = function()
           vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'theprimeagen/harpoon'
    },
    {
        'mbbill/undotree'
    },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
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
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
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
    {
        'Zeioth/compiler.nvim',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo'},
        dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
        opts = {},
    },
    {
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
    },
    {
        'christoomey/vim-tmux-navigator'
    },
    {
        'joeveiga/ng.nvim'
    },
    {
        'f-person/git-blame.nvim'
    },
    {
        'mhartington/formatter.nvim'
    },
    {
        'ionide/Ionide-vim'
    }
  }
