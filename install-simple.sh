#!/bin/bash

git clone https://github.com/joshua7v/vim.git ~/.se-vim
cp ~/.se-vim/.vimrc ~/.vimrc
cp -r ~/.se-vim/.vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sed -i "/^Plugin 'Valloric\/YouCompleteMe'/d" ~/.vimrc
sed -i "/^Plugin 'indexer.tar.gz'/d" ~/.vimrc

vim -u "$HOME/.vimrc" +PluginInstall! +PluginClean +qall
cp -fr ~/.se-vim/snippets ~/.vim/bundle/UltiSnips/mysnippets
