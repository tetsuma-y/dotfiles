"valid ident
:filetype indent on

" タブ幅の設定
set tabstop=4
set shiftwidth=4
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

" some key remap
noremap Q <Nop> 
nnoremap : q:a
nnoremap / q/a
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" % jump update
source $VIMRUNTIME/macros/matchit.vim

"Vundle and plugins
set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

"""Must plugin 
"add operator cmd '\\' for comment
Bundle 'tpope/vim-commentary' 

"Unite IDE
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-gerp'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite-outline'

"For WEB Develop
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lilydjwg/colorizer'

"Color Scheme
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans 
:syntax enable

"タブの設定
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]b :tabprevious<CR>
" tb 前のタブ


""""""""""""""""""""""""""""""""
"VimFiler Toggle
""""""""""""""""""""""""""""""""
nnoremap <silent> <C-k> <ESC>:VimFiler -buffer-name=explorer -split -winwidth=90 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings() 
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)


""""""""""""""""""""""""""""""""
"Unite outline Toggle
""""""""""""""""""""""""""""""""
let g:unite_split_rule = 'botright'
noremap <silent> <C-l> <ESC>:<C-u>Unite -vertical -winwidth=90 outline<CR>
