"---------------------------------------------------------------------------
" yanap's .vimrc
"---------------------------------------------------------------------------
" Enable no Vi compatible commands.
set nocompatible

filetype off
filetype plugin indent off
scriptencoding utf-8

if filereadable(expand('~/dotfiles/vimrc.bundle'))
  source ~/dotfiles/vimrc.bundle
endif

filetype plugin indent on

" basic {{{
let mapleader = ","
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
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" 1単語分のテキストをコピー。コピーしたテキストはクリップボードに入ります。
" "*yw
"
" 7行分のテキストをカット。カットしたテキストはクリップボードに入ります。
" "*7D
" カーソル位置にクリップボードのテキストをペースト。
" "*p
" 「*レジスタ」のデータを出力
" <C-r>*
"
" 無名レジスタに入るデータを、*レジスタにも入れる。
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする。
set clipboard=unnamed,autoselect

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
set helpfile=$VIMRUNTIME/doc/help.txt
" }}} basic

" statusline "{{{
set ruler
set laststatus=2
set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}]
      \[%{&ff}][%3l,%3c,%3p][%{strftime(\"%m/%d\ %H:%M\")}]
"}}} statusline

" color {{{
" colorscheme jellybeans
" colorscheme hybrid
" colorscheme twilight
" colorscheme lucius
" colorscheme solarized
" colorscheme wombat
" colorscheme molokai
" colorscheme rdark
" colorscheme railscasts

" set background=light
set background=dark
syntax on
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

" 補完をON
let g:neocomplcache_enable_at_startup = 1

" 補完メニューの色を変更
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=0

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
"autocmd BufWritePre * :%s/\t/  /ge
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

" plugins setting {{{

" YankRing.vim
nmap ,y ;YRShow<CR>

" minibufexpl.vim
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10
" :Mtで表示をtoggle
command! Mt :TMiniBufExplorer

" Align
" Alignを日本語で
let g:Align_xslen = 3

" VTreeExplorer
" 縦に表示する
let g:treeExpVertical=1

" NERD_commenter.vim
" コメントの間にスペースを空ける
let NERDSpaceDelims=1
" <Leader>xでコメントをtoggle(NERD_commenter.vim)
map <Leader>x, c<space>
" 未対応ファイルタイプのエラーメッセージを表示しない

" grep.vim
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'

" Fugitive.vim
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>

" VTreeExplorer
let g:treeExplVertical=1
"<Leader>t<Space>でディレクトリツリー表示
noremap <Leader>t<Space> :VSTreeExplore<CR>
"分割したウィンドウのサイズ
let g:treeExplWinSize=30

" DumbBuf.vim
"<Leader>b<Space>でBufferList
let dumbbuf_hotkey = '<Leader>b<Space>'
let dumbbuf_mappings = {
    \ 'n': {
        \'<Esc>': { 'opt': '<silent>', 'mapto': ':<C-u>close<CR>' }
    \}
\}
let dumbbuf_single_key  = 1
let dumbbuf_updatetime  = 1    " &updatetimeの最小値
let dumbbuf_wrap_cursor = 0
let dumbbuf_remove_marked_when_close = 1

" vim-indent-guides
nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 4
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
if 'dark' == &background
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
else
    hi IndentGuidesOdd  ctermbg=white
    hi IndentGuidesEven ctermbg=lightgrey
endif

" taglist.Vim
" 関数一覧
set tags=tags
let Tlist_Show_One_File = 1               " 現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWindow = 1             " taglistのウィンドーが最後のウィンドーならばVimを閉じる
let Tlist_Enable_Fold_Column = 1          " 折りたたみ
" let Tlist_Auto_Open = 1                   " 自動表示
let Tlist_Auto_Update = 1
let Tlist_WinWidth = 30
nmap <F7> :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>
nmap <Leader>tl :CMiniBufExplorer<CR>:TrinityToggleTagList<CR>:TMiniBufExplorer<CR>

" operator-camelize.vim
" camel-caseへの変換
map <Leader>u <Plug>(operator-camelize)
map <Leader>U <Plug>(operator-decamelize)

" operator-replace.vim
" RwなどでYankしてるもので置き換える
map R <Plug>(operator-replace)

" smartword.vim
noremap ,w  w
noremap ,b  b
noremap ,e  e
noremap ,ge  ge

map W  <Plug>(smartword-w)
map B  <Plug>(smartword-b)
map E  <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)

" camelcasemotion.vim
" <Shift-wbe>でCameCaseやsnake_case単位での単語移動
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" text-objectで使用できるように
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" Syntastic
" エラー行をsignで表示する
let g:syntastic_enable_signs = 1
" 可能ならhighligt表示する
let g:syntastic_enable_highlighting = 1
" 自動的に開いたり閉じたりする
let g:syntastic_auto_loc_list=1

" powerline
let s:powerline_dir = expand('~/.bundle/powerline/powerline/bindings/vim')
if isdirectory(s:powerline_dir)
  set rtp+=s:powerline_dir
endif

" }}} plugins setting
"
" vim: foldmethod=marker
