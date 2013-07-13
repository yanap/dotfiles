# 環境

## 検証環境

Mac OS X

iTerm2

macvim

## 手順

### iTerm2インストール

http://www.iterm2.com/#/section/downloads

### vimをインストール

macvimをインストールしてからシンボリックリンクを貼る
他の方法もあるけど、コンパイルせなあかんね！

    $ brew install macvim
    $ ls -l /usr/local/bin/mvim
    lrwxr-xr-x  1 yanap  admin    32B  5  4 03:01 mvim@ -> ../Cellar/macvim/7.3-66/bin/mvim
    mkdir -p /Applications/MacVim.app/Contents/MacOS/
    $ ln -s /usr/local/Cellar/macvim/7.3-66/bin/mvim /Applications/MacVim.app/Contents/MacOS/Vim

### bashrcとかに設定

* bashrc


    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'


### vimrcの設定 powerlineのインストールも

NeoBundleつかってる前提で
https://github.com/Shougo/neobundle.vim

powerline詳しくはここ
https://github.com/Lokaltog/powerline



* vimrc

プラグインが入ってるディレクトリは下記の最初らへんにかいてます。
https://github.com/yanap/dotfiles/blob/master/vimrc.bundle


    " ステータスライン
    NeoBundle 'Lokaltog/powerline',  { 'rtp' : 'powerline/bindings/vim'}


    " powerline
    let s:powerline_dir = expand('~/.bundle/powerline/powerline/bindings/vim')
    if isdirectory(s:powerline_dir)
      set rtp+=s:powerline_dir
    endif

### フォント

https://github.com/yanap/dotfiles/tree/master/fonts

ダウンロードしてきてやね

    $ cp * /Library/Fonts/

コピーするだけ

あとは、iterm2の設定でフォントを for powerlineに設定して
