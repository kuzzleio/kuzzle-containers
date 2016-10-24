set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
filetype plugin indent on


syntax on
set background=dark
color codeschool
set laststatus=2
set expandtab
set ts=2
set sw=2
set showcmd
set cursorline
set wildmenu
set showmatch
set hlsearch
set paste
set autoindent
