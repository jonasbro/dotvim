# My vim configuration

This is how I have vim configured

## Installation

> cd # go to your home folder
> git clone git@github.com:/jonasbro/dotvim.git ~/.vim # clone repo into .vim

## Create symlinks

> ln -s ~/.vim/vimrc ~/.vimrc
> ln -s ~/.vim/gvimrc ~/.gvimrc

## Switch to the `~/.vim` directory, and fetch submodules

> cd ~/.vim
> git submodule init
> env GIT_SSL_NO_VERIFY=true git submodule update

## Install dependencies

> sudo aptitude install exuberant-ctags

## Update bundles

> git submodule foreach git pull origin master
