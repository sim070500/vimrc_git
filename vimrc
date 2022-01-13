
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.

set number


set nocompatible              " 去除VI一致性,必須
filetype off                  " 必須

" 設定 runtime path 以包含並初始化 Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一種選擇, 指定 Vundle 安裝插件的路徑
"call vundle#begin('~/some/path/here')

" 讓 Vundle 管理自身,必須
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'lervag/vimtex'
Plugin 'dense-analysis/ale'
Plugin 'preservim/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Yggdroot/indentLine'
"Plugin 'vimairline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
"Plugin 'vimspell'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'reedes/vim-lexical'
" 你的所有插件需要在下面這行之前
call vundle#end()            " 必須
filetype plugin indent on    " 必須
" 要禁止插件改變縮排,可以使用下行替代:
"filetype plugin on

"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar


nnoremap <space> za


au BufNewFile,BufRead *.py 
\set tabstop=4 |
\set softtabstop=4 |
\set shiftwidth=4 |
\set expandtab|
\set autoindent|
\set fileformat=unix


au BufRead,BufNewFile *py,*pyw,*.c,*.h match BadWhitespace /\s\ $/


set encoding=utf-8

let g:tex_favor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

let g:tex_conceal = ''
"set conceallevel=0
autocmd filetype tex setl updatetime=1000
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'xelatex'
let g:livepreview_cursorhold_recompile= 0

nmap <F6> : LLPStartPreview<CR>
imap <F6> <ESC>:LLPStartPreview<CR>

" ale
" yapf: python code formatter
" isort: python import order
" flake8: check coding style whether pep8
let g:ale_fixers = {
\   'python' : ['yapf','isort'],
\}


" yggroot
let g:indentLine_color_term = 100
let g:indentLine_char_list = ['¦', '┆', '┊']
let g:indentLine_setConceal = 0


let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0






let g:UltiSnipsExpandTrigger = '<c-a>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
let g:UltiSnipsEditSplit = "horizontal"




let g:airline#extensions#tabline#enabled = 1
map <F10> :NERDTreeToggle<CR>

"set spelllang=en
"set spell

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1

autocmd FileType tex setlocal spell spelllang=en_us


let g:powerline_pycmd="py3"
set laststatus=2

"colorpairs
let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBrace
""""""""""""""""""""""""""""""



if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif



"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



set t_Co=256
colorscheme torte



