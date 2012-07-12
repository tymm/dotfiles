" tpopes pathogen to manage plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Inserting indents automatically
set smartindent

" Mouse support
set mouse=a

set pastetoggle=<F10>
filetype on
filetype plugin on
syntax on

" Set tab to four spaces for python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

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
