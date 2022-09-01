set encoding=utf-8
scriptencoding utf-8

" Basic
" =====

if &compatible
	set nocompatible " to disable compatibility to old-time vi
endif

filetype on
filetype plugin on
filetype indent on

syntax on

set mouse=a
set tabstop=2 " aka the tab width.
set shiftwidth=2 " width for autoindents.
" set expandtab " to use space instead of tab.
set softtabstop=2 " to make <backspace> working.
set autoindent " for entering a new line.
set cc=80 " line limit.

set ignorecase " for search.
set smartcase " to override `ignorecase` when search capital letters.
set hlsearch " to highlight keywords when search; Do `:noh` to finish.
" set showmatch " when search. (But I don't know what it is?)

set timeout " required by plugin:vim-which-key.
set timeoutlen=500 " ms; Value from spacevim; default: 1000.
set updatetime=100 " ms; Suggested by plugin:vim-gitgutter; default: 4000.
set noshowmode " to let the lightline plugin handles it.
set laststatus=2 " as instructed by plugin:lightline.


" UI
" ==

set linebreak " to wrap line by words.
set showbreak=\ \ ↪ " for indent characters for wrapped lines.
set number " to display line number.
set relativenumber " to display relative line number.
set cursorline " to hightlight horizontally.
" set cursorcolumn " to hightlight vertically.
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:» ",eol:¶
set list " to display special characters.
set showcmd " to show current key stroke in status line.
set wildmenu
" set wildmode=list:longest
set wildmode=list:full " to make repeated presses cycle.


" PLUGINS
" =======

call plug#begin('~/.vim/plugged')

" Important
" ---------

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/fzf' " , { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" UI/UX
" -----

Plug 'preservim/nerdcommenter'    " Originally dev by scrooloose
Plug 'itchyny/lightline.vim'
" Plug 'folke/which-key.nvim'
Plug 'liuchengxu/vim-which-key'   " , { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'laher/fuzzymenu.vim'        " Depend: fzf.vim
" Plug 'skywind3000/vim-quickui'   " Menu bar on top

" Colorscheme
" -----------
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()


" Plugin Configs
" ==============

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1


" Key Bindings
" ============

" NOTE: <C-_> is actually <C-/>.
" NOTE: `xmap` for Visual mode. `vmap` for both Visual and Select mode.

nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
let g:mapleader = " " " from default '\'
let g:maplocalleader = ','

" Move line(s) up or down
vnoremap K    :move '<-2<CR>gv=gv
vnoremap J    :move '>+1<CR>gv=gv

" NERDCommenter
nmap <Leader>/     <Plug>NERDCommenterToggle
xmap <Leader>/     <Plug>NERDCommenterToggle
nmap <Leader>ct    <Plug>NERDCommenterToggle
xmap <Leader>ct    <Plug>NERDCommenterToggle
nmap <C-_>         <Plug>NERDCommenterToggle
xmap <C-_>         <Plug>NERDCommenterToggle

" Which-Key
let g:which_key_map = {}
let g:which_key_map_visual = {}
let g:which_key_map.c = { 'name': '+NERDCommenter' }
let g:which_key_map_visual.c = { 'name': '+NERDCommenter' }
let g:which_key_map.h = { 'name': '+GitGutter' }
let g:which_key_map_visual.h = { 'name': '+GitGutter' }
let g:which_key_map['<Space>'] = {
	\ 'name': 'Note 1',
	\ 'u':   ['', 'undo'],
	\ 'C-r': ['', 'redo'],
	\ 'x':   ['', 'del chtr'],
	\ 'X':   ['', 'bkSpc chtr'],
	\ 'dd':  ['', 'del line'],
	\ 'yy':  ['', 'yank line'],
	\ 'yiw': ['', 'yank word'],
	\ 'p':   ['', 'put a5r'],
	\ 'P':   ['', 'put! :b4'],
	\ 'n':   ['', 'search next'],
	\ 'N':   ['', 'search previous'],
	\ '*':   ['', 'search current word'],
	\ }
let g:which_key_map_visual['<Space>'] = {
	\ 'name': 'Note 1',
	\ 'iw': ['', 'select word'],
	\ 'd':  ['', 'del select'],
	\ 'y':  ['', 'yank select'],
	\ 'p':  ['', 'put a5r'],
	\ 'P':  ['', 'put! b4'],
	\ }
call which_key#register('<Space>', "g:which_key_map", 'n')
call which_key#register('<Space>', "g:which_key_map_visual", 'v')
nnoremap <silent> <Leader>         :<c-u>WhichKey '<Space>'<CR>
xnoremap <silent> <Leader>         :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <LocalLeader>    :<c-u>WhichKey ','<CR>
xnoremap <silent> <LocalLeader>    :<c-u>WhichKeyVisual ','<CR>


" Theme Configs
" =============

set background=dark
" set background=light

let g:onedark_termcolors=256
let g:solarized_termcolors=256
" let g:solarized_termtrans=0
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ }

" colo onedark
" colo solarized
colo gruvbox
