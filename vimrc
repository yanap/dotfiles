" Vundle (NeoVundle) 設定開始
" @see http://vim-users.jp/2011/10/hack238/

filetype.off

if has('vim_starting')
  set runtimepath+='~/.vim/bundle/neobundle'
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Vundle (NeoVundle) 設定終了
filetype plugin indent on
