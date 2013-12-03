" Misaki's .vimrc

" Enable no Vi compatible commands.
set nocompatible

" Neobundle
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \ }}
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

filetype plugin indent on

NeoBundleCheck

" Encoding Settings 
set encoding=utf-8
set fileencoding=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set ambiwidth=double
set fileformats=unix,dos,mac
lang en_US.UTF-8

" Syntax Settings 
syntax enable

" Search Settings 
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz
" 

" Indent Settings 
set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
" 

" View Settings 
set background=dark
colorscheme solarized
set showcmd
set noruler
set showmatch
set wrap
set title
set number
set backspace=indent,eol,start
set scrolloff=5
set formatoptions& formatoptions+=mM
set tw=0
set nobackup
set history=1000
" 

" Folding Settings 
set foldenable
set foldmethod=marker
set foldcolumn=1
