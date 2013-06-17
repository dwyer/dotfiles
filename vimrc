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
autocmd BufNewFile,BufRead profile setl ft=sh

" hard-wraping objective-c is a pain and xcode does a pretty good job of
" soft-wrapping it anyway
autocmd BufNewFile,BufRead *.m setl nolinebreak

" key bindings
let mapleader = ','
map ;           :
map J           <c-d>
map K           <c-u>
map <c-j>       :join<cr>
map <c-s>       :write<cr>
map <leader>,{  =i{
map <leader>,(  =i(
map <leader>bs  :buffers<cr>
map <leader>bw  :bwipeout!<cr>
map <leader>e   :edit<space>
map <leader>ga  :Gwrite<cr>
map <leader>gb  :Gblame<cr>
map <leader>gc  :Gcommit<cr>
map <leader>gd  :Gdiff<cr>
map <leader>gg  :Ggrep<space>
map <leader>gl  :Glog<cr>
map <leader>gm  :Gmove<space>
map <leader>gv  :Gvsplit<cr>
"map <leader>gr  :Gremove<cr>
map <leader>gs  :Gstatus<cr>
map <leader>dg  :diffget<cr>
map <leader>do  :do<cr>
map <leader>dp  :diffput<cr>
map <leader>du  :diffupdate<cr>
map <leader>h   :help<space>
map <leader>m   :make<cr>
"map <leader>n   :tabn<cr>
"map <leader>p   :tabp<cr>
map <leader>q   :quit<cr>
map <leader>r   :source ~/.vimrc<cr>
map <leader>s   :split<space>
map <leader>S   :split<cr>
map <leader>t   :tabnew<space>
map <leader>v   :vsplit<space>
map <leader>w   :write<cr>
map <leader>x   :xit<cr>
map <tab>       :tabn<cr>
map <s-tab>     :tabp<cr>

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
