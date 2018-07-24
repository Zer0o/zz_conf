set number
syntax on
"colorscheme torte
"colorscheme desert
"colorscheme vividchalk
colorscheme zz

"set cursorline

set list
set listchars=tab:>-,trail:-

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set autoindent
set cindent
set hlsearch
set laststatus=2
set cmdheight=2
set wildmenu 
set nocompatible
set encoding=utf8

filetype plugin on

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <F2> :NERDTree<CR>

map 0 ^

"窗口右下角显示未完成的任务
set showcmd

"设置插入符号时，短暂地跳转到匹配的对应符号
set showmatch

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ %=\ Line:\ %l/%L:%c\

execute pathogen#infect()
