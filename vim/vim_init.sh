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

vimruntime=`vim --cmd 'echo $VIMRUNTIME|q'`
dst_zz=${vimruntime}/colors/zz.vim
dst_cvim=${vimruntime}/syntax/c.vim
cvim=${path}/c.vim
vimrc=${path}/.vimrc
zzvim=${path}/zz.vim

\cp ${zzvim} ${dst_zz}
\cp ${cvim} ${dst_cvim}
\cp ${vimrc} ~/.vimrc
