"base
set nocompatible
set vb t_vb=

"search
set history=100

"color
colorscheme darkblue
syntax on

"display
set title
set number
set ruler
set showcmd
set laststatus=2
set hlsearch
set wildmenu
set textwidth=0
set tabstop=4
set shiftwidth=4

"encode
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

autocmd BufWrite *.php :call PHPLint()
function PHPLint()
        let result = system( &ft . ' -l ' . bufname(""))
        echo result
endfunction

"project.vim
" �ե����뤬���򤵤줿�顢������ɥ����Ĥ���
let g:proj_flags = "imstc"

" <Learder>P�ǡ��ץ������Ȥ�ȥ���ǳ��Ĥ���
:nmap <silent> <Leader>P <Plug>ToggleProject

" <Leader>p�ǡ��ǥե���ȤΥץ������Ȥ򳫤�
:nmap <silent> <Leader>p :Project<CR>

" git add
let g:proj_run1='!git add %f'
let g:proj_run_fold1='!git add %f'

" git checkout
let g:proj_run2='!git checkout -- %f'
let g:proj_run_fold2="*!git checkout -- %f"

" git status
let g:proj_run3='!git stautus'
