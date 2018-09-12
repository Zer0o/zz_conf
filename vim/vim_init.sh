#!/bin/sh

# 1. install pathogen
echo "install pathogen begin"

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 2. install NERDTree

echo "install NERDTree begin"

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# 3. install ctags

sudo yum install ctags -y

cd `dirname $0`
path=`pwd`

# fixme: how to get runtime another way?
vv=`vim --version|head -n 1|awk '{print $5}'|tr -d .`
vimruntime="/usr/share/vim/vim"${vv}
dst_zz=${vimruntime}/colors/zz.vim
dst_cvim=${vimruntime}/syntax/c.vim
cvim=${path}/c.vim
vimrc=${path}/.vimrc
zzvim=${path}/zz.vim

sudo \cp ${zzvim} ${dst_zz}
sudo \cp ${cvim} ${dst_cvim}
\cp ${vimrc} ~/.vimrc
