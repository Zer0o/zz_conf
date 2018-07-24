#!/bin/sh

# 1. install pathogen

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 2. install NERDTree

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle

# 3. install ctags

sudo yum install ctags

cd `dirname $0`
path=`pwd`

vimrc=${path}/.vimrc

\cp ${vimrc} ~/.vimrc
