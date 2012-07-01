" Inserting indents automatically
set smartindent

set pastetoggle=<F10>
filetype plugin on
syntax on

" Set tab to four spaces for python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Show tabs and other things by default (thanks to scytale)
set list
set listchars=tab:\|.,trail:_,extends:>,precedes:<,nbsp:_
