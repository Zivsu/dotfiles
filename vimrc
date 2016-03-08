"""""""""""""""""""""""""""""""""""""""""
" => Vundle Settings
"""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " be iMproved, required
filetype off                        " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()                   " required
filetype plugin indent on           " required


""""""""""""""""""""""""""""""""""""""""""
" => General Settings
""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme railscasts
"set background=dark
set cursorline

set history=7000
filetype plugin on
filetype indent on
set nu
set autoread                        " Set auto read when file is changed
set backspace=eol,start,indent      " Configure backspace so it acts as it should act
set encoding=utf8
set clipboard=unnamed               " Use system clipboard

" Search setting
set hlsearch                        " Highlight word when search
set ignorecase
set incsearch                       " Find as you type search

" About brace
set showmatch                       " Move to match brace
set matchtime=3                     " Tenths of a second
let loaded_matchparen=1             " No highlight for match braces

set expandtab                       " Use spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4                       " 1 tab == 4 spaces
set ai                              " Auto indent
set si                              " Smart indent
set wrap                            " Wrap lines

set laststatus=2
set ruler
set showcmd                         " Show command in bottom bar


"""""""""""""""""""""""""""""""""""""""""""
" => Map key
""""""""""""""""""""""""""""""""""""""""""" 
let mapleader = ","                 " Default leader is '\'

map <C-j> <C-W>j                    " Move between split window
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <silent><leader>sv :source ~/.vimrc<CR>
map <silent><leader>ev :edit ~/.vimrc<CR> 

" Normal Mode
"nnoremap E $                       " Move cursor to end of line
"nnoremap B ^                       " Move cursor to begin of lien
nnoremap <silent><leader><space> :nohlsearch<CR>    " Turn off search highlight

" Insert Mode 
inoremap ( ()
inoremap { {}
inoremap [ []


""""""""""""""""""""""""""""""""""""""""""""
" => Special Setting
""""""""""""""""""""""""""""""""""""""""""""
set path=./**                       " Find file in current folder
