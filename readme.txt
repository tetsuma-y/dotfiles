Vundle.vimは、別途以下から持ってくる
https://github.com/gmarik/Vundle.vim

/dotfiles で
git clone https://github.com/gmarik/Vundle.vim
をする。


Linux/Cygwin
シンボリックリンクで.vim->.vimと.vimrc->.vimrcをhome以下につくる。
vimprocは自分でbuildする必要がある。

agはまだ早かった。。。とりあえずgrepでいこう。。。
agはそのままだと文字コードによっては検索対象にはいらないため、buildする前に要修正。
http://blog.monochromegane.com/blog/2013/09/15/the-silver-searcher-detects-japanese-char-set/


Windows
シンボリックリンクで.vim->vimfiles .vimrc->_vimrcをhome以下につくる
WindowsのシンボリックリンクはFullPathでないとだめっぽいので注意。

