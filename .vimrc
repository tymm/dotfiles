" tpopes pathogen to manage plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Don't be compatible with vi
set nocompatible

" Inserting indents automatically
set smartindent

" For working in the sun
set background=dark

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
filetype on
filetype plugin on
syntax on

" Turn on Solarized color scheme
syntax enable
set background=dark
colorscheme solarized

" Configure tags
set tags+=~/.vim/tags

" Re-assigning leader key
let mapleader = ","

" Shortcuts (some need 'stty -ixon -ixoff' before executing vim to work)

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
map <F3> :TlistToggle<CR>

" Toggle NERDTree on <F2>
map <F2> :NERDTreeTabsToggle<CR>

" Build tags of current project with CTRL+F12
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" Better way of moving around wrapped lines
nmap j gj
nmap k gk

" Bash command line behaviour for CTRL+a and CTRL+e
imap <C-e> <esc>$i<right>
imap <C-a> <esc>0i

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

" Set tab to four spaces for python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Automatically save file before running makeprg
set autowrite

" Execute python scripts with :make
autocmd FileType python set makeprg=python\ %

" The following three passages are from https://github.com/scy/dotscy/ and
" partly modified by me
" Show tabs and other things by default
set list
set listchars=tab:\|.,trail:_,extends:>,precedes:<,nbsp:_

" A function to shorten the current encoding as much as possible.
function! ShortFEnc()
	" If no file encoding is set, use the system encoding.
	let e = (&fileencoding == "") ? &enc : &fenc
	if e[0:3] == "utf-"
		" Just return the number for UTF encodings.
		let r = e[4:]
	elseif e == "latin1"
		" That's actually ISO-8859-1.
		let r = "-1"
	elseif e[0:8] == "iso-8859-"
		" Return a dash and the number for ISO-8859 encodings.
		let r = e[8:]
	elseif e[0:1] == "cp"
		" Just return the number for Windows code pages (at least 3 digits)
		let r = e[2:]
	else
		" Okay, no short version. Return the full name.
		let r = e
	endif
	" Add a question mark if fenc is not set.
	if &fileencoding == "" | let r .= "?" | endif
	return r
endfunction

" Status line.
let s = ""
let s = "%{GitBranch()} " | " show Git branch
let s .= "%<" | " truncate at the start
let s .= "%f %8* " | " file name
let s .= '%{&ft==""?"?":&ft} ' | " file type
let s .= "%{toupper(&ff[0:0])} " | " file format (line endings)
let s .= "%{ShortFEnc()}" | " short file encoding
let s .= '%{&bomb?"!":""} ' | " byte-order mark flag
let s .= '%{&et?")".&ts."(":&ts} ' | " tab width, in )( if expandtabs is set
let s .= "%r" | " readonly flag
let s .= "%#warningmsg#" " show syntax errors detected by syntastic
let s .= "%{SyntasticStatuslineFlag()}"
let s .= "%*"
let s .= "%*%=" | " right-justify after here
let s .= "%9*%m%* " | " modified flag
let s .= "0x%02B " | " hex value of current byte
let s .= "%l" | " current line
let s .= ":%c%V" | " column number, virtual column (if different)
let s .= " %P" | " percentage
let s .= "/%LL" | " number of lines
set statusline=%!s
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
