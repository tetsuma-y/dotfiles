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
Bundle 'thinca/vim-quicrun'
Bundle 'vim-scripts/yanktmp.vim'

"Vim SourceExplorer
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'trinity.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'

"For WEB Develop
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lilydjwg/colorizer'

"Color Scheme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans 
:syntax enable

" Open and close all the three plugins on the same time 
nmap <F8>   :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
nmap <F10>  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
nmap <F11>  :TrinityToggleNERDTree<CR> 
