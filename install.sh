#!/bin/bash
set -e

git submodule init
git submodule update

# For rupa-z jumper
mkdir -p ~/.z
backup=~/dotfiles_backup
mkdir -p $backup

files=[
  ~/.zshrc 
  ~/.vimrc
  ~/.vim
  ~/.gitconfig
  ~/.gitignore_global
]

for x in $files; do
  if [ -f $x ]; then
    mv $x $backup
  fi
done

ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/vim/vimrc ~/.vimrc
ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/git/gitconfig ~/.gitconfig
ln -s $(pwd)/git/gitignore_global ~/.gitignore_global

# Install all vim Vundle plugins
vim +PluginInstall +qall

# Install ctags
sudo apt-get install exuberant-ctags
