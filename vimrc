" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

autocmd FileType python set tabstop=4 | set shiftwidth=4 | set expandtab
autocmd FileType html set tabstop=4 | set shiftwidth=4 | set expandtab
autocmd FileType tex set tabstop=4 | set shiftwidth=4 | set expandtab

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


call pathogen#infect()

let g:syntastic_disabled_filetypes = ['rst']

:set t_Co=256
:colorscheme molokai
:set cursorline
:set number
:set hlsearch

filetype plugin on
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

:set mouse=a

function RepeatCharacter(linenum, occ)
	let line = getline(a:linenum)
	if strlen(line) > 0
		let c = line[0]
		if match(line, '^[' . c . ']\{2,}$') != -1
			call setline(a:linenum, repeat(c, a:occ))
		endif
	endif
endfunction

function FixUnderline()
	let view = winsaveview()
	let n = strlen(getline('.'))
	call RepeatCharacter(line('.') + 1, n)
	call RepeatCharacter(line('.') - 1, n)
	call winrestview(view)
endfunction

nnoremap <F2> :<C-U>call FixUnderline()<CR>

let g:syntastic_python_checker_args='--ignore=E122,E124,E126,E127,E128'
