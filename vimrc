if !filereadable($HOME.'/.vim/bundle/vundle/README.md')
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Rip-Rip/clang_complete'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" filetypes
syntax on
filetype plugin indent on
autocmd FileType c setl cin cino=(0 cino=:0 tw=80
autocmd BufNewFile,BufRead *.gyp setl ft=python
autocmd BufNewFile,BufRead *.json setl ft=javascript
autocmd BufNewFile,BufRead *.li setl lisp ft=li
autocmd BufNewFile,BufRead *.sub setl lisp ft=sub
autocmd BufNewFile,BufRead gitconfig setl ft=gitconfig
autocmd BufNewFile,BufRead profile setl ft=sh

" hard-wraping objective-c is a pain and xcode does a pretty good job of
" soft-wrapping it anyway
autocmd BufNewFile,BufRead *.m setl nolinebreak

" key bindings
map ;           :
map J           <c-d>
map K           <c-u>
noremap Q       q
map du          :diffupdate<cr>
map ga          :Gwrite<cr>
map gb          :Gblame<cr>
map gc          :Gcommit<cr>
map gd          :Gdiff<cr>
map gh          :Gbrowse<cr>
map gl          :Glog<cr>
map gm          :Gmove<space>
map gp          :Git push<cr>
map gv          :Gvsplit<cr>
map gq          :quit<cr>
"map gr          :Gremove<cr>
map gr          :Ggrep<space>
map gs          :Gstatus<cr>
map gw          :write<cr>
map gx          :xit<cr>
map q           :quit<cr>
map <c-j>       :join<cr>
map <space>     :write<cr>
map <tab>       :tabn<cr>
map <s-tab>     :tabp<cr>

"leader key bindings
let mapleader = ','
map <leader>,{  =i{
map <leader>bs  :buffers<cr>
map <leader>bw  :bwipeout!<cr>
map <leader>e   :edit<space>
map <leader>h   :help<space>
map <leader>m   :make<cr>
"map <leader>n   :tabn<cr>
"map <leader>p   :tabp<cr>
map <leader>o   :only<cr>
map <leader>q   :quit<cr>
map <leader>r   :source ~/.vimrc<cr>
map <leader>s   :split<space>
map <leader>S   :split<cr>
map <leader>t   :tabnew<space>
map <leader>v   :vsplit<space>
map <leader>w   :write<cr>
map <leader>x   :xit<cr>

" format and indentation
set autoindent
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set expandtab
set linebreak
set shiftwidth=4
set nosmartindent
set tabstop=8
set textwidth=80

" misc
silent !mkdir -p ~/.vimtmp
set backupdir=~/.vimtmp
set directory=~/.vimtmp
set hidden
set nomodeline                  " freebsd paranoia
set number
set wildmode=list:longest

" status line
set laststatus=2
set ruler
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" search
set nohlsearch
set incsearch
set ignorecase
set smartcase
nmap \q :nohlsearch<cr>

" terminal stuff
set t_Co=256
if filereadable($HOME.'/.vim/bundle/vim-colors-solarized/README.mkd')
    colors solarized
endif
hi Normal ctermbg=none
