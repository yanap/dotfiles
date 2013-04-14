" viとの互換性をOFFにする
set nocompatible

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

" basic
" {{{

set vb t_vb= " mute the beep


" }}}
