while read i
do git submodule add $i
done < modules

git submodule init
git submodule update

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
