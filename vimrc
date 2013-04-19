call pathogen#infect()

syntax on
filetype on
filetype indent on
filetype plugin on

"indent
set autoindent
"set smartindent
set expandtab

set backupdir=~/.vimtmp
set directory=~/.vimtmp
set hidden
"set shell=/bin/bash
set number
set ruler
set wildmode=list:longest

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" ctrl+c to escape
"imap <C-c> <C-[>
"nmap <C-a> <Home>
"nmap <C-e> <End>

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

" colors!
set t_Co=256
"let g:zenburn_high_Contrast=1
"colors zenburnt
colors solarized
hi Normal ctermbg=none

autocmd BufNewFile,BufRead *.gyp set ft=python
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufRead,BufNewFile *.sub set filetype=sub
