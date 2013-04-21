" Bundles {{{
set nocompatible " viと互換モードにしない
" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off
scriptencoding utf-8

" neobundle {{{
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'
" }}} neobundle

" unite {{{
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'tsukkee/unite-help'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'basyura/unite-rails'
  NeoBundle 'thinca/vim-unite-history'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'choplin/unite-vim_hacks'
" }}} unite

" utility {{{
  " vimshell : vimのshell
  NeoBundle 'Shougo/vimshell.git'
  " vimproc : vimから非同期実行。vimshelleで必要
  NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
  " vim-altercmd : Ex command拡張
  NeoBundle 'tyru/vim-altercmd'
  " urilib.vim : vim scriptからURLを扱うライブラリ
  NeoBundle 'tyru/urilib.vim'
  " Buffer管理のLibrary
  NeoBundle 'thinca/vim-openbuf'
  " vimからGit操作する
  NeoBundle 'tpope/vim-fugitive'
  " vimdoc-ja
  NeoBundle 'vim-jp/vimdoc-ja'
" }}} utility

" colorscheme {{{
try
NeoBundle 'nanotech/jellybeans.vim'
  colorscheme jellybeans
catch
endtry
colorscheme desert
" }}} colorscheme

" powerline(statusline) {{{

" }}}

" completion {{{
  " 入力補完
  NeoBundle 'Shougo/neocomplcache'
  " neocomplcacheのsinpet補完
  NeoBundle 'Shougo/neosnippet.git'
  " various langueages snippets
  NeoBundle 'honza/snipmate-snippets'
  " for rsense
  NeoBundle 'm2ym/rsense'
  NeoBundle 'taichouchou2/vim-rsense'
  " rubyでrequire先を補完する
  " NeoBundle 'ujihisa/neco-ruby'
" }}} completion

" search and move{{{
  " vim-smartword : 単語移動がスマート
  NeoBundle 'smartword'
  " camelcasemotion : CamelCaseやsnake_case単位でのワード移動
  NeoBundle 'camelcasemotion'
  " <Leader><Leader>w/fなどで、motion先をhilightする
  NeoBundle 'EasyMotion'
  " matchit.vim : 「%」による対応括弧へのカーソル移動機能を拡張
  NeoBundle 'matchit.zip'
  " ruby用のmatchit拡張
  NeoBundle 'ruby-matchit'
  " grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
  NeoBundle 'grep.vim'
  " eregex.vim : vimの正規表現をrubyやperlの正規表現な入力でできる :%S/perlregex/
  NeoBundle 'eregex.vim'
  " open-browser.vim : カーソルの下のURLを開くor単語を検索エンジンで検索
  NeoBundle 'tyru/open-browser.vim'
" }}} search and move

" edit {{{
  " NERD_commenter.vim :最強コメント処理 (<Leader>c<space>でコメントをトグル)
  NeoBundle 'scrooloose/nerdcommenter.git'
  " -- でメソッドチェーン整形
  NeoBundle 'c9s/cascading.vim'
  " visually indent guide
  NeoBundle 'nathanaelkane/vim-indent-guides'
  " XMLとかHTMLとかの編集機能を強化する
  NeoBundle 'xmledit'
  " Align : 高機能整形・桁揃えプラグイン
  NeoBundle 'Align'
  " フィルタリングと整形
  NeoBundle 'godlygeek/tabular'
  " マルチバイト対応の整形
  NeoBundle 'h1mesuke/vim-alignta'
  " YankRing.vim : ヤンクの履歴を管理し、順々に参照、出力できるようにする
  NeoBundle 'YankRing.vim'
  " undo履歴を追える (need python support)
  NeoBundle 'Gundo'
  " surround.vim : テキストを括弧で囲む／削除する
  NeoBundle 'tpope/surround.vim'
  " smartchr.vim : ==などの前後を整形
  NeoBundle 'smartchr'
  " vim-operator-user : 簡単にoperatorを定義できるようにする
  NeoBundle 'operator-user'
  " operator-camelize : camel-caseへの変換
  NeoBundle 'operator-camelize'
  " operator-replace : yankしたものでreplaceする
  NeoBundle 'operator-replace'
  " textobj-user : 簡単にVimエディタのテキストオブジェクトをつくれる
  NeoBundle 'textobj-user'
  " vim-textobj-syntax : syntax hilightされたものをtext-objectに
  NeoBundle 'kana/vim-textobj-syntax.git'
  " vim-textobj-plugins : いろんなものをtext-objectにする
  NeoBundle 'thinca/vim-textobj-plugins.git'
  " vim-textobj-lastpat : 最後に検索されたパターンをtext-objectに
  NeoBundle 'kana/vim-textobj-lastpat.git'
  " vim-textobj-indent : インデントされたものをtext-objectに
  NeoBundle 'kana/vim-textobj-indent.git'
  " vim-textobj-function : 関数の中身をtext-objectに
  NeoBundle 'kana/vim-textobj-function.git'
  NeoBundle 'textobj-rubyblock'
  " vim-textobj-entire : buffer全体をtext-objectに
  NeoBundle 'textobj-entire'
  " 「foo」 or 【bar】などをtext-objectに
  NeoBundle 'textobj-jabraces'
  " <C-a>でtrue/false切替。他色々
  NeoBundle 'taku-o/vim-toggle'
" }}}

" programming {{{
  " quickrun.vim : 編集中のファイルを簡単に実行できるプラグイン
  NeoBundle 'thinca/vim-quickrun'
  " perldocやphpmanual等のリファレンスをvim上で見る
  NeoBundle 'thinca/vim-ref'
  " SQLUtilities : SQL整形、生成ユーティリティ
  NeoBundle 'SQLUtilities'
  " vim-ruby : VimでRubyを扱う際の最も基本的な拡張機能
  NeoBundle 'vim-ruby/vim-ruby'
  " rails.vim : rails的なアレ
  NeoBundle 'tpope/vim-rails'
  " Pydiction : Python用の入力補完
  NeoBundle 'Pydiction'
  " ソースコード上のメソッド宣言、変数宣言の一覧を表示
  NeoBundle 'taglist.vim'
  " エラーがある場所をhilight
  NeoBundle 'errormarker.vim'
  " tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
  " NeoBundle 'Source-Explorer-srcexpl.vim'
  " NERD_tree, taglist, srcexpl の統合
  " NeoBundle 'trinity.vim'
" }}} programming

" syntax {{{
  " haml
  NeoBundle 'haml.zip'
  " JavaScript
  NeoBundle 'JavaScript-syntax'
  " jQuery
  NeoBundle 'jQuery'
  " nginx conf
  NeoBundle 'nginx.vim'
  " markdown
  NeoBundle 'tpope/vim-markdown'
  " coffee script
  NeoBundle 'kchmck/vim-coffee-script'
  " python
  NeoBundle 'yuroyoro/vim-python'
  " clojure
  NeoBundle 'jondistad/vimclojure'
  " syntax checking plugins exist for eruby, haml, html, javascript, php, python, ruby and sass.
  NeoBundle 'scrooloose/syntastic'
" }}}

" buffer {{{
  " DumbBuf.vim : quickbufっぽくbufferを管理。 "<Leader>b<Space>でBufferList
  NeoBundle 'DumbBuf'
  " minibufexpl.vim : タブエディタ風にバッファ管理ウィンドウを表示
  NeoBundle 'minibufexpl.vim'
  " NERDTree : ツリー型エクスプローラ
  NeoBundle 'The-NERD-tree'
  " vtreeexplorer.vim : ツリー状にファイルやディレクトリの一覧を表示
  NeoBundle 'vtreeexplorer'
" }}} buffer

" encoding {{{
  NeoBundle 'banyan/recognize_charcode.vim'
" }}} encoding

filetype plugin indent on
" }}} Bundles

" basic {{{
let mapleader = "," " キーマップリーダー
set scrolloff=5 " スクロール時の上下の余白行数
set textwidth=0 " 自動折り返ししない
set nobackup " バックアップを取らない
set autoread " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイルは作らない
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープ音をならさない
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0 " モードラインは無効
" ファイルブラウザの開始時、どのディレクトリを開くかを指定する。
set browsedir=buffer " バッファで開いているファイルのディレクトリ
" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2
"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa
" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
set helpfile=$VIMRUNTIME/doc/help.txt
" }}} basic

" statusline {{{
set ruler
set laststatus=2
set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}]
      \[%{&ff}][%3l,%3c,%3p][%{strftime(\"%m/%d\ %H:%M\")}]
" }}} statusline

" color {{{
syntax on
set background=dark
set synmaxcol=9999
" }}} color

" indent {{{
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set tabstop=2 shiftwidth=2 softtabstop=0
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
endif
" }}}

" apperance {{{
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" コマンド実行中は再描画しない
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast
" }}} apperance

" complete {{{
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加
" }}} complete

" search {{{
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
" }}} search

" edit {{{
" IMEの設定
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
" Tabキーを空白に変換
set expandtab
" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
"  Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>
" :Ptでインデントモード切替
command! Pt :set paste!
" インサートモード中に<C-o>でyankした内容をputする
inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" }}}

" encoding {{{
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング
set termencoding=utf-8
set fileencoding=utf-8
" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
" }}}
