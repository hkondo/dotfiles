"---------------------------------------------------------------------------
" Misaki's .vimrc
"---------------------------------------------------------------------------

" Initialize {{{
" Enable no Vi compatible commands.
set nocompatible

" Load neobundle.
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" }}}

" neobundle.vim {{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
" Complement
NeoBundle 'Shougo/neocomplcache'
" ruby / rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'rhysd/neco-ruby-keyword-args'
" Javascript, HTML
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

filetype plugin indent on

" Installation check
NeoBundleCheck
" }}}

" necomplcache {{{
let g:neocomplcache_enable_at_startup = 1
" }}}
" Encoding Settings {{{
set encoding=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set ambiwidth=double
set fileformats=unix,dos,mac
lang en_US.UTF-8
" }}}

" Syntax Settings {{{
syntax enable
" }}}

" Search Settings {{{
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
" }}}

" Indent Settings {{{
set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
" }}}

" View Settings {{{
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
" }}}

" Folding Settings {{{
set foldenable
set foldmethod=marker
set foldcolumn=1
" }}}
