"""call pathogen#infect()

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/vundle/README.md")
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
    let has_vundle=0
endif
filetype off
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'

"freebsd paranoia
set nomodeline

syntax on
set autoindent
"set smartindent
set expandtab
set shiftwidth=4
set tabstop=4

set backupdir=~/.vimtmp
set directory=~/.vimtmp
set hidden
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

set t_Co=256
colors solarized
hi Normal ctermbg=none

"" filetypes
filetype on
filetype indent on
filetype plugin on
au BufNewFile,BufRead *.gyp setl ft=python
au BufNewFile,BufRead *.json setl ft=javascript
au BufNewFile,BufRead *.li setl lisp ft=li
au BufNewFile,BufRead *.sub setl ft=sub
au FileType c setl cin cino=(0 cino=:0 et sw=4 tw=80
