"valid ident
:filetype indent on

" タブ幅の設定
set tabstop=4
set shiftwidth=4

set encoding=utf-8
set fileencodings=utf-8
set number
colorscheme zellner  

set nocompatible
filetype off

set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

"Vundle
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
"Ruby
Bundle 'rails.vim'

"Html
Bundle 'Emmet.vim'

