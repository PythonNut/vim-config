#/usr/bin/env sh
mkdir -p ~/.vim/bundle
cd ~/.vim
git clone https://github.com/Shougo/neobundle.vim bundle/neobundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc 2> /dev/null

if [ -f /usr/bin/gvim ]; then
  gvim -v
else
  vim
fi

