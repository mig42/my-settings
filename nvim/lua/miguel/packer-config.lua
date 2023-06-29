vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use ({
        'EdenEast/nightfox.nvim',
        as = 'nightfox',
        config = function()
            vim.cmd('colorscheme nightfox')
        end
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })

    use('ThePrimeagen/harpoon')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    --use('OmniSharp/omnisharp-vim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires =
        {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'saadparwaiz1/cmp_luasnip'},
        {'rafamadriz/friendly-snippets'},
    },

    use('williamboman/nvim-lsp-installer'),
    use('neovim/nvim-lspconfig'),

    use 'stevearc/aerial.nvim',
    --use 'tpope/vim-vinegar',
    use 'lukas-reineke/indent-blankline.nvim',

    use 'nvim-tree/nvim-web-devicons',
    use 'lewis6991/gitsigns.nvim',
    use 'romgrk/barbar.nvim',
    use 'nvim-tree/nvim-tree.lua',
    use 'numToStr/Comment.nvim',
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    use 'github/copilot.vim',
}
end)