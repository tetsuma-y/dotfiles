Vundle.vimは、別途以下から持ってくる
https://github.com/gmarik/Vundle.vim

/dotfiles/.vim で
git clone https://github.com/gmarik/Vundle.vim
をする。

unite-outlineをするためには、
C++ではctagsが必要

Gtagsの設定
http://blog.matsumoto-r.jp/?p=2369
http://www.gnu.org/software/global/
CtagsはやめてGtags(GNU GLOBAL)へ移行しよう！

Ctagsの設定
1. ソースの一番rootなところで ctags -R * を実行
2. ~/.vimrcに :set tags=.tags; を追加
3. ~/.bashrcに alias ctags='ctags -f .tags' を追加

C++向けに clang がvim-clang-formatで必要
#yum install clang

ruby向けにrubocopが必要
#gem install rubocop

Linux/Cygwin
シンボリックリンクで.vim->.vimと.vimrc->.vimrcをhome以下につくる。
vimprocは自分でbuildする必要がある。

agはまだ早かった。。。とりあえずgrepでいこう。。。
agはそのままだと文字コードによっては検索対象にはいらないため、buildする前に要修正。
http://blog.monochromegane.com/blog/2013/09/15/the-silver-searcher-detects-japanese-char-set/


Windows
シンボリックリンクで.vim->vimfiles .vimrc->_vimrcをhome以下につくる
WindowsのシンボリックリンクはFullPathでないとだめっぽいので注意。

