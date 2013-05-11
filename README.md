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


