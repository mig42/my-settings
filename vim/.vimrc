" General

let mapleader = ","
set timeout timeoutlen=1000 ttimeoutlen=50

" Mouse
set mouse=a
set clipboard=unnamedplus

set nocompatible
set encoding=utf-8
set history=1000
set autoread
set hidden
set backspace=indent,eol,start

" Appearance

syntax on
set cursorline
set showmatch
set colorcolumn=80,100
set scrolloff=8
set laststatus=2
set showcmd
set wildmenu

" Line numbers toggle

set number relativenumber
set numberwidth=4

nnoremap <leader>n :set relativenumber!<CR>

" Indentation

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

augroup filetype_indent
    autocmd!
    autocmd FileType html,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Fountain-specific settings

augroup fountain_ft
    autocmd!
    autocmd BufRead,BufNewFile *.fountain set filetype=fountain
augroup END
 
augroup fountain
    autocmd!
    autocmd FileType fountain setlocal textwidth=80
    autocmd FileType fountain setlocal wrap
    autocmd FileType fountain setlocal linebreak
augroup END



" Search

set incsearch
set hlsearch
set ignorecase
set smartcase

nnoremap <leader>/ :nohlsearch<CR>

" Splits

set splitbelow
set splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quality of life

" Keep visual selection after indent
vnoremap < <gv
vnoremap > >gv

" Move lines up/down with Alt+j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap j :m .+1<CR>==
nnoremap k :m .-2<CR>==
vnoremap j :m '>+1<CR>gv=gv
vnoremap k :m '<-2<CR>gv=gv


" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <leader>w :w<CR>

" Y behaves like D and C (Yank to EOL)
nnoremap Y y$

" Don't lose clipboard when pasting
vnoremap p "_dP

" Plugins

call plug#begin('~/.vim/plugged')

" Commenting - gc to comment a motion, gcc for current line
Plug 'tpope/vim-commentary'

" Surround - add/change/delete surrounding brackets, quotes, tags
" cs"' changes "hello" to 'hello'
" ds" deletes surrounding quotes
" ysiw] wraps word in []
Plug 'tpope/vim-surround'

" Repeat - makes . repeat plugin actions (needed by surround)
Plug 'tpope/vim-repeat'

" Fuzzy file finder - Ctrl+P to open files fast
Plug 'ctrlpvim/ctrlp.vim'

" File tree explorer - toggle with <leader>e
Plug 'preservim/nerdtree'

" Status bar - lightweight and informative
Plug 'vim-airline/vim-airline'

" Git integration - show diff in gutter, stage hunks, etc.
Plug 'jiangmiao/auto-pairs'

" Color scheme - gruvbox is easy on the eyes in a dark terminal
Plug 'morhetz/gruvbox'

" Fountain syntax
Plug 'vim-scripts/fountain.vim'

" LaTeX plugin
Plug 'lervag/vimtex'

" Allow +clipboard for vim-wayland
Plug 'jasonccox/vim-wayland-clipboard'

call plug#end()

" Plugins configuration

" Open file tree explorer with <leader>e
nnoremap <leader>e :NERDTreeToggle<CR>

" Gruvbox
colorscheme gruvbox
set background=dark

" LaTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
