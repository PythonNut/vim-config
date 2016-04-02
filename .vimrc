set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
let mapleader = "-"

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Install and load bundles
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'fugitive.vim'
NeoBundle 'easymotion/vim-easymotion'

if has('lua')
  NeoBundle 'Shougo/neocomplete'
endif
NeoBundle 'auto-pairs'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'repeat.vim'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'sheerun/vim-polyglot'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Enable line numbers and make them relative
set guioptions-=M
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=DejaVu\ Sans\ Mono\ 11
" Enable clipboard integration
set clipboard=unnamedplus

" Map key chords because Esc is so annoying
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

nmap [<Space>  O<Esc>
nmap ]<Space>  o<Esc>

" Enable superior ex completion
set wildmenu
set wildmode=longest:list,full
set tildeop

" Unleash the holy war on tabs
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent

" various useful tweaks
set scrolloff=4
set showmatch
set smartcase
set incsearch
set undolevels=1000
set history=1000
set mouse=a
set ttyfast
set ttymouse=xterm2
set cursorline
syntax on

set backupdir=~/.vim/backup,/tmp
set directory=~/.vim/swap,/tmp

" Setup eastmotion
nmap <Space> <Plug>(easymotion-prefix)

" Enable the awesome solarized colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

if has('lua')
  so ~/.vim/auto_completion.vim
endif

" Unite is to vim as Helm is to Emacs
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-k> :Unite -start-insert source command window buffer line file_rec/async<CR>
