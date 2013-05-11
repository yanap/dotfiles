# dotfiles

## vim

### モード切り替え
起動したときは、NOMALモード
* a, iでINSERTモード
* vを入力でVISUALモード
* Ctrl+vで矩形VISUALモード
* Shift+v(V)で行VISUALモード → これで、選択してyでヤンクしてpでペーストするのは便利

---

### カーソル移動
h 左, j 下, k 上, l 右, 0 行頭, ^ 行の最初の文字, $行末

---

### モーション
d$ 現在のカーソル位置から後を消す
dw 現在ののカーソル位置の１単語を消去

    {count}{action}{motion}

dd 一行削除, yy １行ヤンク,  cw 1単語削除後にすぐにINSERT
p カーソル位置の後にペースト, P カーソル位置の前にペースト

### アンドゥ、リドゥ
u アンドゥ 直前に行った動作を取り消す, <C-R>(Ctrl+R) リドゥ アンドゥを取り消す

### ファイル操作
:w 上書き保存, :e {file} ファイルオープン, :r {file} ファイル読み込み、現在編集中のファイルにペースト

### 検索
/{検索したい文字} で検索, n で下方向に、N (Shift+n)で上方向に

### 置換
:s/{pattern}/{replace}, :%s/{pattern}/{replace}で全体

### コメント
" , :mapや:!の後ろには書けない

### オプション
:set , 設定の確認は :set tabstop? で?で確認, スペースで複数設定
+= 追加, ^= 先頭に追加, -= 取り除く

### キーマッピング
mapはキーシーケンスを展開したあと、さらに別のマップを適用しようとします
noremapは一度だけ展開します
:help map.txt
* モードに対するコマンド
map/noremap NOMALとVISUAL
nmap/nnoremap NOMAL
imap/inoremap INSERT
cmap/cnoremap COMMAND
vmap/vnoremap VISUAL
map!/noremap! NOMAL, COMMAND
* mapのオプション
<slient> コマンドラインへの表示を抑制、キーマッピングからコマンドを実行する場合に使用
<unique> キーマッピングが重複した場合にエラーにする 通常は上書き
<buffer> バッファローカルなキーマッピングを定義
<expr> マップ先の文字列をVimの式とみなして、評価した結果の文字列をマップします

* mapleader

設定されていない場合にはバックスラッシュが使用されます。例:
:map <Leader>A  oanother line<Esc>
これは次のものと同じ意味です: >
:map \A  oanother line<Esc>
しかし次のように設定したあとでは: >
:let mapleader = ","
次のものと同じ意味になります: >
:map ,A  oanother line<Esc>

### 変数
let, unlet 設定、解除

* スコープ
g:グローバル, b:バッファローカル, w:ウィンドウローカル, t:タブページローカル
s:スクリプトローカル, l:関数ローカル, v:組み込み関数, a:関数の引数

* 環境変数
$

* オプション変数
&

### 制御構文

if, elseif, else, endif 条件分岐

while 条件が真である間処理が実行
    while i < 5
    endwhile

for リストの中身を走査
    for e in [1, 2, 3]
      echo e
    endfor

### ユーザ定義関数

    function! Sum(v1, v2)
      return a:v1 + a:v2
    endfunction

function, function! 同名の関数を上書き

* autocommand
イベント発生時にコマンドを実行する

    :au[tocmd] [group] {event} {pat} [nested] {cmd}

:autocmd! 削除

### ヘルプ
:help,  <F1>, <Help> キー

    :help {subject}
    :help :edit

* ヘルプ内での移動
CTRL-] 詳細項目への移動
CTRL-T, CTRL-O 戻る

### ウィンドウを移動

CTRL-W CTRL-W 画面移動
CTRL-W h 左の画面に移動
CTRL-W j 上の画面に移動
CTRL-W k 下の画面に移動
CTRL-W l 右の画面に移動

### クリップボード

快適なコピペ駆動開発のために(笑)

    brew install macvim

して、.bashrcに

    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias macvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

を設定してmacvimを使うか

    hg clone https://vim.googlecode.com/hg/ vim
    cd vim
    hg update vim73
    make clean
    ./configure --prefix=/usr/local --enable-multibyte --enable-xim --enable-fontset --enable-rubyinterp --enable-perlinterp --enable-pythoninterp --with-features=huge --disable-selinux
    make
    make install

色々、コンパイルの仕方はあるけど、上記のような感じで +clipboardつきのvimをインストールしてあげてbashrcとかに

    alias vim='/usr/local/bin/vim'

vimで起動するようにalias貼って.vimrcとかに

    set clipboard=unnamed,autoselect

を書けば、コピペ環境を構築できる

### 編集

* 複数行の行頭に同じ文字列を挿入する

CTRL-VでVISUAL BLOCKモードにしてIを押してテキストを入力しESCかCTRL-[で抜ける
すると選択範囲の左端に挿入される Aだと右端


