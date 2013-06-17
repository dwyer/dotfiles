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
nnoremap ;              :
nnoremap H              ^
nnoremap J              <c-d>
nnoremap K              <c-u>
nnoremap L              $
nnoremap Q              q
nnoremap du             :diffupdate<cr>
nnoremap ga             :Gwrite<cr>
nnoremap gb             :Gblame<cr>
nnoremap gc             :Gcommit<cr>
nnoremap gd             :Gdiff<cr>
nnoremap gh             :Gbrowse<cr>
nnoremap gl             :Glog<cr>
nnoremap gm             :Gmove<space>
nnoremap gp             :Git push<cr>
nnoremap gv             :Gvsplit<cr>
"nnoremap gr             :Gremove<cr>
nnoremap gr             :Ggrep<space>
nnoremap gs             :Gstatus<cr>
nnoremap gw             <c-w>
nnoremap gx             :xit<cr>
nnoremap q              :quit<cr>
nnoremap <c-j>          :join<cr>
nnoremap <space>        :write<cr>
nnoremap <tab>          :tabn<cr>
nnoremap <s-tab>        :tabp<cr>

"leader key bindings
let mapleader = ','
nnoremap <leader>{      =i{
nnoremap <leader>bs     :buffers<cr>
nnoremap <leader>bw     :bwipeout!<cr>
nnoremap <leader>e      :edit<space>
nnoremap <leader>h      :help<space>
nnoremap <leader>m      :make<cr>
"nnoremap <leader>n      :tabn<cr>
"nnoremap <leader>p      :tabp<cr>
nnoremap <leader>o      :only<cr>
nnoremap <leader>r      :source ~/.vimrc<cr>
nnoremap <leader>s      :split<space>
nnoremap <leader>S      :split<cr>
nnoremap <leader>t      :tabnew<space>
nnoremap <leader>v      :vsplit<space>
nnoremap <leader>x      :xit<cr>

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
