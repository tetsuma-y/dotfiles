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

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"Vundle
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
"mru,reg,buf
noremap <Leader>um :Unite file_mru -buffer-name=file_mru
noremap <Leader>ur :Unite register -buffer-name=register
noremap <Leader>ub :Unite buffer -buffer-name=buffer

"file current_dir
noremap <Leader>ufc :Unite file -buffer-name=file
noremap <Leader>ufcr :Unite file_rec -buffer-name=file_rec

"file file_current_dir
noremap <Leader>uff :UniteWithBufferDir file -buffer-name=file
noremap <Leader>uffr :UniteWithBufferDir file_rec -buffer-name=file_rece 'thinca/vim-ref'

Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/yanktmp.vim'

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

