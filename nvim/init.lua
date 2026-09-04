-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- General
vim.g.mapleader = ","
vim.opt.encoding = "utf-8"
vim.opt.history = 1000
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.backspace = "indent,eol,start"
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 50

-- Appearance
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.colorcolumn = "80,100"
vim.opt.scrolloff = 8
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Keymaps
local map = vim.keymap.set

map("n", "<leader>n", ":set relativenumber!<CR>")
map("n", "<leader>/", ":nohlsearch<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>a")
map("n", "<leader>w", ":w<CR>")
map("n", "Y", "y$")
map("v", "p", '"_dP')
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Filetype indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "javascript", "typescript" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Fountain
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.fountain",
    callback = function()
        vim.opt_local.filetype = "fountain"
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

-- Plugins
require("lazy").setup({
    -- Tpope classics
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",

    -- Fuzzy finder (reemplaza ctrlp con telescope, mucho más potente)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<C-p>", "<cmd>Telescope find_files<cr>" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        },
    },

    -- File tree (reemplaza NERDTree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    -- Status bar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({ options = { theme = "auto" } })
        end,
    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- Color scheme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },

    -- Fountain
    "vim-scripts/fountain.vim",

    -- LaTeX
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    },

    -- LSP para C
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {})
            vim.lsp.enable("clangd")
        end,
    },

    -- Autocompletado
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Treesitter para mejor syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = { "c", "lua", "python", "typescript", "javascript" },
                highlight = { enable = true },
            })
        end,
    },
})
