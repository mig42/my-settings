vim.opt.guicursor = ''
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

--vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.inccommand = 'split'
vim.opt.splitbelow = true

vim.opt.splitright = true
vim.opt.ttyfast = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
vim.opt.colorcolumn = { '80', '100', '120' }

vim.g.mapleader = ' '

--set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
--set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
--set cursorline " Highlights the current line in the editor
--set hidden " Hide unused buffers
--set autoindent " Indent a new line
--set inccommand=split " Show replacements in a split screen
--set mouse=a " Allow to use the mouse in the editor
--set number " Shows the line numbers
--set splitbelow splitright " Change the split screen behavior
--set title " Show file title
--set wildmenu " Show a more advance menu
--set cc=80,100,120 " Show at 80 column a border for good code style
--set spell " enable spell check (may need to download language package)
--set ttyfast " Speed up scrolling in Vim
