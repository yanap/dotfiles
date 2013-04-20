set nocompatible " viと互換モードにしない

" Vundle (NeoVundle) start
" {{{

filetype off
filetype plugin off
filetype indent off

if has('vim_starting')
  set runtimepath+='~/.vim/bundle/neobundle.vim'
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

filetype plugin on
filetype indent on " with filetype on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

" }}}
" Vundle (NeoVundle) end

" basic settings
" {{{
let mapleader = "," " キーマップリーダー
set scrolloff=5 " スクロール時の上下の余白行数
set textwidth=0 " 自動折り返ししない
set nobackup " バックアップを取らない
set autoread " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイルは作らない
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=2 " backspace anything delete(indent,eol, start)
set formatoptions=lmoq " テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープ音をならさない
" }}}