-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Color scheme (rose pine)
    use ({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Manage
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Java
    use {
        'nvim-java/nvim-java',
        requires = {
            {'nvim-java/lua-async-await'},
            {'nvim-java/nvim-java-core'},
            {'nvim-java/nvim-java-test'},
            {'nvim-java/nvim-java-dap'},
            {'MunifTanjim/nui.nvim'},
            {'mfussenegger/nvim-dap'},
        }
    }

    use 'nanotee/sqls.nvim'

    require('lspconfig').sqls.setup{
        on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr)
        end
    }

    use {
        "tpope/vim-dadbod",
        requires = { 
            "kristijanhusak/vim-dadbod-ui",  
            "kristijanhusak/vim-dadbod-completion" 
        },
        config = function()
            require("config.dadbod").setup()
        end,
    }
end)
