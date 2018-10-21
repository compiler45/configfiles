set nocompatible

call plug#begin('~/.vim/plugged')

" vim-plug Plugin Manager
Plug 'w0rp/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'nvie/vim-flake8'
Plug 'bps/vim-textobj-python'
Plug 'janko-m/vim-test'
Plug 'skywind3000/asyncrun.vim'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jreybert/vimagit'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'

Plug 'wincent/ferret'

Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-smartinput'

Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'posva/vim-vue'
Plug 'jasonlong/vim-textobj-css'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'glts/vim-textobj-comment'
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'jeetsukumaran/vim-pythonsense'

Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --js-completer --java-completer'}

" Status bar for displaying currently virtualenv, git branch, etc.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-bufferline'
Plug 'christoomey/vim-tmux-navigator'

Plug 'lervag/vimtex'
Plug 'rbonvall/vim-textobj-latex'

Plug 'rizzatti/dash.vim'

" Colorschemes
"
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'

" All plugins must be added before the following line
call plug#end()            " required

filetype on
set laststatus=2
set hlsearch
set incsearch

" set python version within Vim
set pyxversion=3

" make vimtest run tests asynchronously
let test#strategy = 'asyncrun'

" Test mappings
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-g> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-v> :TestVisit<CR>   " t Ctrl+g


" Force true colour on
set termguicolors

" open quickfix window after each asyncrun command, set height to 10 lines
let g:asyncrun_open = 10
" show asyncrun status on airline
let g:asyncrun_status = "stopped" 
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])


" default color scheme
set background=dark
colorscheme deep-space
let g:deepspace_italics=1

" Display all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1
" Pretty AirLine colours
let g:airline_theme='deep_space'

" ALE linting
let g:ale_linters = {
      \    'javascript': ['eslint'],
      \    'python': ['flake8'],
      \    'html': ['htmlhint', 'eslint'],
      \    'sh': ['shellcheck'],
      \    'json': ['jq']
      \ }
let g:ale_linters_explicit = 1
let g:ale_python_flake8_options = '--max-line-length 120'

" ALE mappings
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Enable matchit plugin for jumping between braces
runtime macros/matchit.vim

" Tabs and spaces
set autoindent 
set expandtab 
set shiftwidth=4 
set softtabstop=4 
set tabstop=4 

"PEP8 indentation
au BufNewFile,BufRead *.py
      \ set textwidth=120 |
      \ set fileformat=unix 

" Magit mapping 
map <leader>m :Magit<CR>
let g:magit_commit_title_limit=100

" Customisations for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path='python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Set undo directory, disables undo function for /tmp/ files
set undofile
set undodir=~/.vim/undo

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

if has("autocmd")
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" close left and right window without navigating to them

" Make Gdiff split vertically
set diffopt+=vertical

"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See docstrings for folded code
let g:SimpylFold_docstring_preview=1

set encoding=utf-8

" Make code look pretty
let python_highlight_all=1
syntax on

" Hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Set <C-n> mapping for NERDTree
map <C-n> :NERDTreeToggle<CR>

" Turn on line numbering
set nu

" Allow access to system clipboard
set clipboard=unnamed

" Show branch name
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" opening files in current directory
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

" turn on omni-completion for CSS
set omnifunc=csscomplete#CompleteCSS

" emmet leader key binding
let g:user_emmet_leader_key='<C-C>'

" tagbar toggle
map <C-t> :TagbarToggle<CR>

" yank text to end of line
map Y y$

" C-p mapping for FZF
nnoremap <C-p> :<C-u>FZF<CR>

" Reload .vimrc
nnoremap <leader>R :source ~/.vimrc<cr>

" go from insert mode to normal mode
inoremap jk <esc>

" Duplicate line
nnoremap + yyp

" Delete line
nnoremap - dd

" edit .vimrc oh so easily!
nnoremap <leader>ev :vsp ~/.vimrc<cr>
nnoremap <leader>es :sp ~/.vimrc<cr>

" delete line, stay in insert mode
inoremap <c-d> <esc>S

" capitalise a word, stay at end of word
inoremap <c-u> <esc>gUawea

" a mapping to delete the last character at the end of a line

" save files as soon as they are created
" autocmd BufNewFile * :write

" expand cls -> class in python files
autocmd FileType python :iabbrev cls class

" class init
autocmd FileType python :iabbrev clsinit def __init__(self):<left><left>
