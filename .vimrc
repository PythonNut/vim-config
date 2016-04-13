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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'easymotion/vim-easymotion'

if has('lua')
  NeoBundle 'Shougo/neocomplete'
endif
NeoBundle 'auto-pairs'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'justinmk/vim-sneak'

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
let g:EasyMotion_smartcase = 0
nmap <Space> <Plug>(easymotion-prefix)
nmap <Space>w <Plug>(easymotion-wl)
nmap <Space>e <Plug>(easymotion-el)
nmap <Space>b <Plug>(easymotion-bl)
nmap <Space>ge <Plug>(easymotion-gel)

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

" Vim sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
let g:sneak#s_next = 1
