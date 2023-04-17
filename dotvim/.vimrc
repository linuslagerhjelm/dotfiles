set nocompatible
filetype plugin indent off
syntax off

"Set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'wikitopian/hardmode'

call vundle#end()            
filetype plugin indent on    

"Set how many lines of history VIm has to remember
set history=700

"Enable filetype plugins
filetype plugin on
filetype indent on

"Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

"Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase

"Highlight search results
set hlsearch

"Make search act like in modern browsers
set incsearch

"Show matching brackets when text indicator is over them
set showmatch

"Disable sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Enable syntax highlight
syntax enable

colorscheme desert
set background=dark

"Set utf8 as standard encoding
set encoding=utf8

"Turn of vim built in backup
set nobackup
set nowb
set noswapfile

"Use spaces instead of tabs
set expandtab

"Be smart when using tabs ;)
set smarttab

"Set tab length
set shiftwidth=2
set tabstop=2

"Linebreak on 80 characters
set lbr
set tw=80

"Always show the status line
set laststatus=2

"Point out 80 char column
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=238

"Remap space to : 
nmap <space> :
vmap <space> :

"Highlight current line
set cursorline
hi CursorLine term=bold cterm=NONE ctermbg=238

"Disallow the mouse to copy line numbers
set mouse=a

"Configure line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Disable arrow buttons
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
