#/usr/bin/env sh
mkdir -p ~/.vim/dein
cd ~/.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/dein_installer.sh
sh ~/.vim/dein_installer.sh ~/.vim/dein
rm -f ~/.vim/dein_installer.sh
ln -s ~/.vim/.vimrc ~/.vimrc 2> /dev/null
