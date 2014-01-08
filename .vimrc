"valid ident
:filetype indent on

" タブ幅の設定
set tabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8
set fileencodings=utf-8
set number
set nocompatible
set list
filetype off

" for gVim
set guioptions-=T
set guioptions-=m

" % jump update
source $VIMRUNTIME/macros/matchit.vim

"Vundle and plugins
set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

"""Must plugin 
"add operator cmd '\\' for comment
Bundle 'tpope/vim-commentary' 

"Vundle
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/yanktmp.vim'

"Filer
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite.vim'
"Html
Bundle 'Emmet.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lilydjwg/colorizer'

"Color Scheme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans 
:syntax enable

