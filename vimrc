set t_Co=256
"let g:zenburn_high_Contrast=1
colors zenburnt
hi Normal ctermbg=none

syntax on
filetype plugin indent on

"indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set hidden
set wildmode=list:longest
set backupdir=~/.vimtmp
set directory=~/.vimtmp
inoremap jj <esc>
nmap <C-a><Tab> <C-w><C-w>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
  
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype indent on
filetype plugin on
