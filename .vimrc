"valid indent
:filetype indent on
:filetype plugin on

"valid backspace
set backspace=2
set backspace=indent,eol,start

" タブ幅の設定
set tabstop=4
set shiftwidth=4
set expandtab

" 表示系
set encoding=utf-8
set fileencodings=sjis,euc-jp,utf-8
set number
set nocompatible
set list
set colorcolumn=80
set hlsearch
filetype off

" for gVim
set guioptions-=T
set guioptions-=m

" clipboard
set clipboard+=unnamed

" some key remap
noremap Q <Nop>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>


" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ?  'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'.  s:SID_PREFIX() .  'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag] <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9) 
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>' 
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]b :tabprevious<CR>
" tp 前のタブ

" % jump update
source $VIMRUNTIME/macros/matchit.vim

"Vundle and plugins
if has('n32') || has('win64')
  let $DOTVIM = expand('$HOME/vimfiles')
else
  let $DOTVIM = expand('~/.vim')
endif

set rtp+=$DOTVIM/Vundle.vim
call vundle#rc('$DOTVIM/bundle')

"""Must plugin 
"add operator cmd '\\' for comment
Bundle 'tpope/vim-commentary' 

"Unite IDE
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite-outline'

"vimshell
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc'

"For WEB Develop
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lilydjwg/colorizer'

"Color Scheme
:syntax enable
:set t_Co=256
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans
set background=dark

"Syntax Check
Bundle 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['rubocop']

""""""""""""""""""""""""""""""""
"VimFiler
""""""""""""""""""""""""""""""""
nnoremap <silent> ;f <ESC>:VimFiler -buffer-name=explorer<Cr>
autocmd! FileType vimfiler call s:my_vimfiler_settings() 
function! s:my_vimfiler_settings()
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
"Unite outline
""""""""""""""""""""""""""""""""
let s:unite_split_rule = 'botright'
noremap ;o <ESC>:<C-u>Unite -winwidth=90 outline<CR>

""""""""""""""""""""""""""""""""
"Unite-grep setting
""""""""""""""""""""""""""""""""
" 大文字小文字を区別しない
let s:unite_enable_ignore_case = 1
let s:unite_enable_smart_case = 1

" current bufferに対してgrep
nnoremap <silent> ;g  :<C-u>Unite grep:% -buffer-name=search-buffer<CR>

" 範囲を指定してgrep
nnoremap <silent> ;G :<C-u>Unite grep: -buffer-name=search-buffer<CR>

" grep検索結果の再呼出
nnoremap <silent> ;r  :<C-u>UniteResume search-buffer<CR>


""javascript sup
Bundle 'myhere/vim-nodejs-complete'
Bundle 'mattn/jscomplete-vim'

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
      let g:neocomplcache_omni_functions = {}
  endif
  let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

  let g:node_usejscomplete = 1

"" neocomplcache
Bundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

