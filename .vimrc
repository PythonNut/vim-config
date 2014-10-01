set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Install and load bundles
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Enable line numbers and make them relative
set number
set relativenumber

" Map key chords because Esc is so annoying
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Enable superior ex completion
set wildmenu
set wildmode=longest:list,full

" Unleash the holy war on tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Enable the awesome solarized colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
