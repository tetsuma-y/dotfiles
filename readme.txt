Linux/Cygwin
シンボリックリンクで.vim->.vimと.vimrc->.vimrcをhome以下につくる。
vimproc,ag は自分でbuildする必要がある。
agはそのままだと文字コードによっては検索対象にはいらないため、buildする前に要修正。
http://blog.monochromegane.com/blog/2013/09/15/the-silver-searcher-detects-japanese-char-set/


Windows
シンボリックリンクで.vim->vimfiles .vimrc->_vimrcをhome以下につくる
WindowsのシンボリックリンクはFullPathでないとだめっぽいので注意。

