" tpopes pathogen to manage plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Don't be compatible with vi
set nocompatible

" Inserting indents automatically
set smartindent

" Use 256 colors
set t_Co=256

" Show line numbers
set number

" Set tabstop and shiftwidth to 4
set tabstop=4
set shiftwidth=4

" Mouse support (To insert from X use Shift+middle-click now)
set mouse=a

" Better search
set incsearch
set hlsearch

" Normal backspace
set backspace=indent,eol,start

set pastetoggle=<F10>
filetype off
filetype plugin indent on
syntax on

" Enable Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Set color scheme for vim-airline (statusbar)
let g:airline_theme='light'

" Configure tags
set tags+=~/.vim/tags

" Re-assigning leader key
let mapleader = ","

" Shortcuts (some need a 'stty -ixon -ixoff' in the terminal before executing vim)
" Navigate through splits
inoremap <C-j> <Esc>:wincmd W<CR>
nnoremap <C-j> :wincmd W<CR>
inoremap <C-k> <Esc>:wincmd w<CR>
nnoremap <C-k> :wincmd w<CR>

" Navigate through tabs
inoremap <C-l> <Esc>gt<CR>
nnoremap <C-l> gt<CR>
inoremap <C-h> <Esc>gT<CR>
nnoremap <C-h> gT<CR>

inoremap <C-w> <Esc>:w<CR>
nnoremap <C-w> :w<CR>

inoremap <C-q> <Esc>:q<CR>
nnoremap <C-q> :q<CR>

inoremap <Leader>w <Esc>:tabnew<CR>
nnoremap <Leader>w :tabnew<CR>

inoremap <Leader>x <Esc>:make<CR>
nnoremap <Leader>x :make<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Toggle TagList on <F3>
map <F10> :TlistToggle<CR>

" Toggle NERDTree on <F2>
map <F9> :NERDTreeTabsToggle<CR>

" Build tags of current project with F12
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" Better way of moving around wrapped lines
nmap j gj
nmap k gk

" Bash command line behaviour for CTRL+a and CTRL+e
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A

" Remap ESC key
inoremap jk <ESC>

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set viewoptions=cursor,folds,slash,unix

" OmniCppComplete Options
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1 " complete with .
let OmniCpp_MayCompleteArrow = 1 " complete with ->
let OmniCpp_MayCompleteScope = 1 " complete with ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" Turn on Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Make Eclim and YCM play nice together
let g:EclimCompletionMethod = 'omnifunc'

" Set tab to four spaces for python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Automatically save file before running makeprg
set autowrite

" Execute python scripts with :make
autocmd FileType python set makeprg=python\ %

" Always show a status line.
set laststatus=2

" Syntastic plugin options
" Error window will be automatically opened and closed
let g:syntastic_auto_loc_list=1 
" When automatic syntax checking is done
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['python','c','cpp', 'html','tex','php'],
                               \ 'passive_filetypes': [] }
" Syntax checking when buffers are first loaded as well as on saving
let g:syntastic_check_on_open=1

" Using SuperTab to get the omnicomplete popup menu
let g:SuperTabDefaultCompletionType = "context"
" Fallback in case context completion fails
let g:SuperTabContextDefaultCompletionType = "<c-p>"
" Closing the preview window after completion
let g:SuperTabClosePreviewOnPopupClose = 1

" automatically start NERDTree
" autocmd vimenter * NERDTree

" set width of NERDTree
let NERDTreeWinSize=20

" automatically close NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show tabs and other things by default
set list
set listchars=tab:\|.,trail:_,extends:>,precedes:<,nbsp:_

" Disable swapfiles
set noswapfile

" Delete until end of line with D
nnoremap D d$

" Show a search result in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Rainbow parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Automatically adjust height of quickfix window
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
	exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Vundle (plugin manager)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'
