"valid ident
:filetype indent on

" タブ幅の設定
set tabstop=2
set shiftwidth=2

set encoding=utf-8
set fileencodings=utf-8
set number

set nocompatible
filetype off

set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"Vundle
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

"Ruby
Bundle 'rails.vim'

"Html
Bundle 'Emmet.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lilydjwg/colorizer'

"Color Scheme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans 
:syntax enable

