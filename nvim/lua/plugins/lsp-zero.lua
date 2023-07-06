return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = { -- LSP Support
        {'neovim/nvim-lspconfig'}, -- Required
        { -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        {'hrsh7th/nvim-cmp'}, -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'}, -- Required
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'saadparwaiz1/cmp_luasnip'},
        {'rafamadriz/friendly-snippets'}
    },
    config = function(lazy, opts)
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(_, bufnr)
            local opts = {
                buffer = bufnr
            }
            lsp.default_keymaps(opts)

            vim.keymap.set('n', 'K', function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set('n', '<leader>vws', function()
                vim.lsp.buf.workspace_symbol()
            end, opts)
            vim.keymap.set('n', '<leader>db', function()
                vim.diagnostic.goto_prev()
            end, opts)
            vim.keymap.set('n', '<leader>df', function()
                vim.diagnostic.goto_next()
            end, opts)

        end)

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup(opts)

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            sources = {{
                name = 'path'
            }, {
                name = 'nvim_lsp'
            }, {
                name = 'buffer',
                keyword_length = 3
            }, {
                name = 'luasnip',
                keyword_length = 2
            }, {
                name = 'nvim_lsp_signature_help'
            }},
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({
                    select = false
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward()
            }
        })

    end
}

