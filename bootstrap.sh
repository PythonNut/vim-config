#/usr/bin/env sh
mkdir -p ~/.vim/bundle
cd ~/.vim
git clone https://github.com/Shougo/neobundle.vim bundle/neobundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc 2> /dev/null
vim

