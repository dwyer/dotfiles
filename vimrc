syntax on
filetype on
filetype indent on
filetype plugin on

"indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set backupdir=~/.tmp/vim
set directory=~/.tmp/vim
set viminfo+=n~/.tmp/viminfo
set hidden
set shell=/bin/bash
set wildmode=list:longest

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
  
imap <C-c> <C-[>

" colors!
set t_Co=256
"let g:zenburn_high_Contrast=1
colors zenburnt
hi Normal ctermbg=none

