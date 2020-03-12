INSTALL
=======

Windows
-------

    git submodule init
    git submodule update

    mklink /j %USERPROFILE%\.vim %cd%\vim
    mklink %USERPROFILE%\.vimrc %cd%\vim\vimrc
    mklink %USERPROFILE%\.gitignore_global %cd%\git\gitignore_global
    mklink %USERPROFILE%\.gitconfig %cd%\git\gitconfig

    # git config --global core.excludesfile ~/.gitignore_global

    # vim ~\_vimrc 
    # source path\to\dotfiles\vim\vimrc

PATHOGEN
========

    cd path\to\dotfiles
    git submodule add https://github.com/someplugin.git vim\bundle\someplugin


VIM
===

* MRU: Most Recently Used VIM Plugin, used by quick fuzzy file open plugins
* CtrlP: Full path fuzzy file/buffer/MRU/tag finder for VIM
  :CtrlP or :CtrlP [dir]
  <F5>: purge the cache
  <c-f>, <c-b> to switch modes
  <c-d>: use filename only (instead of full path)
  <c-r>: regex mode
  <c-j>/<c-k>: navigate the result list
  <c-t>/<c-v>, <c-x>: open selected in new tab or split
  <c-y>: create new file
  <c-z>: mark files to open with <c-o>
  :help ctrl-commands, :help ctrlp-extensions

