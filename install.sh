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
  if [ -f ~/.zshrc ]; then
    mv ~/.zshrc $backup
  fi
done

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore_global ~/.gitignore_global

# config git, requires z-shell:
vared -p "Git user.name: " git_username
vared -p "Git user.email: " git_useremail
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name $git_username
git config --global user.email $git_useremail

