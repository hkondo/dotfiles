"---------------------------------------------------------
"" Misaki's .vimrc
"---------------------------------------------------------

if has('vim_starting')
  set nocompatible  " Enable no Vi compatible commands.

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


"---------------------------------------------------------
"" NeoBundle install packages.
"---------------------------------------------------------
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \   },
  \ }

NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

"" Color
NeoBundle 'tomasr/molokai'

"" Ruby Bundle
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-projectionist"
NeoBundle "thoughtbot/vim-rspec"
NeoBundle "majutsushi/tagbar"

"" Javascript Bundle
NeoBundle "scrooloose/syntastic"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------
"" Basic Setup
"---------------------------------------------------------
"" Encoding
set enc=utf-8
set fencs=utf-8

"" Tab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab 

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
lang en_US.UTF-8


"---------------------------------------------------------
"" Visual Settings
"---------------------------------------------------------
syntax enable
set ruler
set number
colorscheme molokai
set title

let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"---------------------------------------------------------
"" Abbreviations
"---------------------------------------------------------
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

"---------------------------------------------------------
"" Autocmd Rules
"---------------------------------------------------------
"" make/cmake
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake

if has("gui_running")
  autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"---------------------------------------------------------
"" Mappings
"---------------------------------------------------------
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"---------------------------------------------------------
"" Plugin settings
"---------------------------------------------------------
"" vim-airline
let g:airline_enable_syntastic = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


"" vimfiler configurations.
" vimfiler behaves as default explorer
" start :e .
let g:vimfiler_as_default_explorer = 1

"" neocomplete.vim configurations.
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  "$ "
let g:vimshell_secondary_prompt = "> "
nnoremap <silent> <leader>sh :VimShellCreate<CR>
