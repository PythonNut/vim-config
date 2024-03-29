if &compatible
  set nocompatible
endif

let $CACHE = expand('~/.vim')
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/.cache/dein//'))

" Install and load bundles
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')
call dein#add('Shougo/unite.vim')
call dein#add('lifepillar/vim-solarized8')
call dein#add('tpope/vim-fugitive')
call dein#add('easymotion/vim-easymotion')

if has('lua')
  call dein#add('Shougo/neocomplete')
endif
call dein#add('vim-scripts/auto-pairs')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-rsi')
call dein#add('sickill/vim-pasta')
call dein#add('sheerun/vim-polyglot')
call dein#add('justinmk/vim-sneak')
call dein#add('mbbill/undotree')
call dein#add('ojroques/vim-oscyank')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

let mapleader = "-"
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
set viminfo+=n~/.vim/.viminfo

" Setup eastmotion
let g:EasyMotion_smartcase = 0
nmap <Space> <Plug>(easymotion-prefix)
nmap <Space>w <Plug>(easymotion-wl)
nmap <Space>e <Plug>(easymotion-el)
nmap <Space>b <Plug>(easymotion-bl)
nmap <Space>ge <Plug>(easymotion-gel)
omap <Space> <Plug>(easymotion-prefix)
omap <Space>w <Plug>(easymotion-wl)
omap <Space>e <Plug>(easymotion-el)
omap <Space>b <Plug>(easymotion-bl)
omap <Space>ge <Plug>(easymotion-gel)

" Enable the awesome solarized colorscheme
set background=dark
colorscheme solarized8

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

" Configure undo-system
if has("persistent_undo")
  set undodir=~/.vim/undo/
  set undofile
endif

if $TERM == 'tmux-256color'
  set termguicolors
endif

let g:oscyank_silent = v:true
let g:oscyank_term = 'default'
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
