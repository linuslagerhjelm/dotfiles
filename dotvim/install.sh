#This script will overwrite your current .vimrc wit the one of the repo
#Takes care of installing the most neccesiry dependencies
cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
