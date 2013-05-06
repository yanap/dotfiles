"---------------------------------------------------------------------------
" yanap's .vimrc
"---------------------------------------------------------------------------
" Initialize:"{{{
"
" Enable no Vi compatible commands.
set nocompatible

" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off
scriptencoding utf-8

" Use ',' instead of '\'.
" It is not mapped with respect well unless I set it before setting for plug in.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Release keymappings for plug-in.
nnoremap ;  <Nop>
xnoremap ;  <Nop>
nnoremap m  <Nop>
xnoremap m  <Nop>
nnoremap ,  <Nop>
xnoremap ,  <Nop>

let s:neobundle_dir = expand('~/.bundle')
if has('vim_starting') "{{{
  " Set runtimepath.
  " Load neobundle.
  if isdirectory('neobundle.vim')
    set runtimepath+=neobundle.vim
  elseif finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath+=' . finddir('neobundle.vim', '.;')
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(s:neobundle_dir.'/neobundle.vim')
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir.'/neobundle.vim'
    endif
    execute 'set runtimepath+=' . s:neobundle_dir.'/neobundle.vim'
  endif
endif
"}}}

let g:neobundle#enable_tail_path = 1
let g:neobundle#default_options = {
      \ 'default' : { 'overwrite' : 0 },
      \ }

call neobundle#rc(s:neobundle_dir)

" neobundle.vim"{{{
  NeoBundleFetch 'Shougo/neobundle.vim', '', 'default'
  NeoBundle 'anyakichi/vim-surround', {
      \ 'autoload' : {
      \   'mappings' : [
      \     ['n', '<Plug>Dsurround'], ['n', '<Plug>Csurround'],
      \     ['n', '<Plug>Ysurround'], ['n', '<Plug>YSurround']
      \ ]}}
NeoBundle 'Shougo/echodoc', '', 'default'
call neobundle#config('echodoc', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})
NeoBundle 'Shougo/echodoc', '', 'default'
call neobundle#config('echodoc', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})

NeoBundle 'Shougo/neocomplcache', '', 'default'
call neobundle#config('neocomplcache', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})

NeoBundle 'Shougo/neocomplcache-rsense', '', 'default'
call neobundle#config('neocomplcache-rsense', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/neocomplcache',
      \ 'autoload' : { 'filetypes' : 'ruby' }
      \ })

NeoBundle 'Shougo/neosnippet', '', 'default'
call neobundle#config('neosnippet', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \   'filetypes' : 'snippet',
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }})

NeoBundle 'Shougo/neobundle-vim-scripts', '', 'default'

NeoBundle 'Shougo/unite.vim', '', 'default'
call neobundle#config('unite.vim',{
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'Unite',
      \                   'complete' : 'customlist,unite#complete_source'},
      \                 'UniteWithCursorWord', 'UniteWithInput']
      \ }})
NeoBundle 'Shougo/unite-build', '', 'default'
NeoBundle 'Shougo/unite-ssh', '', 'default'
NeoBundleLazy 'ujihisa/vimshell-ssh', { 'autoload' : {
      \ 'filetypes' : 'vimshell',
      \ }}
NeoBundle 'Shougo/unite-sudo', '', 'default'
NeoBundleLazy 'Shougo/vim-vcs', {
      \ 'depends' : 'thinca/vim-openbuf',
      \ 'autoload' : {'commands' : 'Vcs'},
      \   }
NeoBundle 'Shougo/vimfiler', '', 'default'
call neobundle#config('vimfiler', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \    'commands' : [
      \                  { 'name' : 'VimFiler',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'VimFilerExplorer',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Edit',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  { 'name' : 'Write',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  'Read', 'Source'],
      \    'mappings' : ['<Plug>(vimfiler_switch)'],
      \    'explorer' : 1,
      \ }
      \ })
NeoBundle 'Shougo/vimproc', '', 'default'
call neobundle#config('vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

NeoBundle 'Shougo/vimshell', '', 'default'
call neobundle#config('vimshell', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'VimShell',
      \                   'complete' : 'customlist,vimshell#complete'},
      \                 'VimShellExecute', 'VimShellInteractive',
      \                 'VimShellTerminal', 'VimShellPop'],
      \   'mappings' : ['<Plug>(vimshell_switch)']
      \ }})
NeoBundleLazy 'yomi322/vim-gitcomplete', { 'autoload' : {
      \ 'filetype' : 'vimshell'
      \ }}
" vimからバイナリファイルを開けるプラグイン
NeoBundle 'Shougo/vinarise', '', 'default'
call neobundle#config('vinarise', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : 'Vinarise',
      \ }})
NeoBundle 'Shougo/unite-outline', '', 'default'
call neobundle#config('unite-outline', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'unite_sources' : 'outline'},
      \ })
NeoBundleLazy 'hail2u/vim-css3-syntax'
NeoBundleLazy 'kana/vim-smartchr', { 'autoload' : {
      \ 'insert' : 1,
      \ }}
NeoBundleLazy 'kana/vim-smartword', { 'autoload' : {
      \ 'mappings' : [
      \   '<Plug>(smartword-w)', '<Plug>(smartword-b)', '<Plug>(smartword-ge)']
      \ }}
NeoBundleLazy 'kana/vim-smarttill', { 'autoload' : {
      \ 'mappings' : [
      \   '<Plug>(smarttill-t)', '<Plug>(smarttill-T)']
      \ }}
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace', {
      \ 'depends' : 'vim-operator-user',
      \ 'autoload' : {
      \   'mappings' : [
      \     ['nx', '<Plug>(operator-replace)']]
      \ }}
NeoBundleLazy 'kana/vim-textobj-user'

NeoBundleLazy 'kien/ctrlp.vim'
NeoBundleLazy 'Shougo/foldCC',
      \  { 'autoload' : { 'filetypes' : 'vim' }}
NeoBundleLazy 'mattn/wwwrenderer-vim'
NeoBundleLazy 'mattn/webapi-vim'


  NeoBundleLocal ~/.vim/bundle
"}}}

" 文字コードの自動認識プラグイン {{{
  NeoBundle 'banyan/recognize_charcode.vim'
"}}}

filetype plugin indent on

" Enable syntax color.
syntax enable

" Installation check.
NeoBundleCheck
"}}}

"---------------------------------------------------------------------------
" Encoding:"{{{
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


"---------------------------------------------------------------------------
" Search:"{{{

" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase option.
set smartcase

" Enable incremental search.
set incsearch
" Don't highlight search result.
set nohlsearch

" Searches wrap around the end of the file.
set wrapscan

"}}}

"---------------------------------------------------------------------------
" Edit:"{{{

"}}}

" Smart insert tab setting.
set smarttab
" Exchange tab to spaces.
" set expandtab
" Round indent by shiftwidth.
set shiftround
" Enable modeline.
set modeline

" Display another buffer when current buffer isn't saved.
set hidden

" Ignore case on insert completion.
set infercase

" Enable folding.
set foldenable
" set foldmethod=expr
set foldmethod=marker
" Show folding level.
set foldcolumn=3
set fillchars=vert:\|
set commentstring=%s

" Use grep.
set grepprg=grep\ -nH

" Exclude = from isfilename.
set isfname-==

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=1000

" Set swap directory.
set directory-=.

" Set tags file.
" Don't search tags file in current directory. And search upward.
set tags& tags-=tags tags+=./tags;
if v:version < 703 || (v:version == 7.3 && !has('patch336'))
  " Vim's bug.
  set notagbsearch
endif

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

"---------------------------------------------------------------------------
" View:"{{{



"}}}



" vim: foldmethod=marker
