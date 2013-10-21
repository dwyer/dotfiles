" vundle {{{1

if !filereadable($HOME.'/.vim/bundle/vundle/README.md')
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Rip-Rip/clang_complete'
Bundle 'altercation/vim-colors-solarized'
Bundle 'dwyer/li.vim'
Bundle 'gmarik/vundle'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'mattn/zencoding-vim'
" Bundle 'msanders/cocoa.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

filetype plugin indent on

" Syntax Highlighting {{{1

syntax on
highlight Normal ctermbg=none
set background=dark
if filereadable($HOME.'/.vim/bundle/vim-colors-solarized/README.mkd')
    colorscheme solarized
    call togglebg#map("<F6>")
endif

" Format and Indentation {{{1

set autoindent
set backspace=indent,eol,start
set colorcolumn=+0
set expandtab
set linebreak
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=8
set textwidth=80

" Status Line {{{1

set laststatus=2 " always show the status line
set ruler
if filereadable($HOME.'/.vim/bundle/vim-fugitive/README.markdown')
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" Search {{{1

set nohlsearch
set incsearch
set ignorecase
set smartcase
set wildmode=list:longest
set wildmenu

" Misc {{{1

if !filereadable($HOME.'/.vimtmp')
    silent !mkdir -p ~/.vimtmp
endif
set backupdir=~/.vimtmp//
set cryptmethod=blowfish
set directory=~/.vimtmp//
set foldlevel=3
set nohidden
set nomodeline
set number
set scrolloff=1
set spelllang=en_us

" Filetypes {{{1

" filetype plugin indent on

function! ObjcFold()
    " A function for folding Objective-C code.
    let line = getline(v:lnum)
    if line == '@end'
        return 0
    elseif line =~ '^@interface' || line =~ '^@implementation'
        return '>1'
    elseif line =~ '^#pragma mark'
        return '>2'
    elseif line =~ '^[\+\-][^;]*$'
        return '>3'
    endif
    return '='
endfunction

if has('autocmd')
    autocmd FileType c setlocal cin cino=(0 cino=:0
    autocmd FileType gitcommit setlocal spell
    autocmd FileType html setlocal nolinebreak shiftwidth=2
    autocmd FileType htmldjango setlocal nolinebreak shiftwidth=2
    autocmd FileType java setlocal textwidth=100
    autocmd FileType li setlocal lisp
    autocmd FileType lisp setlocal lispwords+=syntax-rules
    autocmd FileType mail setlocal spell textwidth=72
    autocmd FileType objc setlocal foldcolumn=4 foldexpr=ObjcFold() 
                \ foldmethod=expr foldtext=getline(v:foldstart) nolinebreak
    autocmd FileType vim setlocal foldcolumn=3 foldmethod=marker
    autocmd BufNewFile,BufRead *.gyp setfiletype python
    autocmd BufNewFile,BufRead *.json setfiletype javascript
    autocmd BufNewFile,BufRead *.li,*.sub setfiletype li
    autocmd BufNewFile,BufRead *.m setfiletype objc
    autocmd BufNewFile,BufRead *.muttrc setfiletype muttrc
    autocmd BufNewFile,BufRead *.txt setlocal formatoptions+=a
    autocmd BufNewFile,BufRead gitconfig setfiletype gitconfig
    autocmd BufNewFile,BufRead mutt-* setfiletype mail
    autocmd BufNewFile,BufRead profile setlocal filetype=sh
endif

" Mappings {{{1

" Normal mappings {{{2
" Note: New mappings that clobber default mappings should be remapped to
" <leader>[mapping].

nnoremap <c-h>              H
nnoremap <c-j>              J
nnoremap <c-l>              L
nnoremap <cr>               za
nnoremap <f5>               :source $MYVIMRC<cr>
nnoremap <space>            :write<cr>
nnoremap <tab>              <c-w>
nnoremap <tab><tab>         <c-w>w
nnoremap H                  ^
nnoremap J                  <c-d>
nnoremap K                  <c-u>
nnoremap L                  $
nnoremap Q                  q
nnoremap U                  <c-r>
nnoremap cx                 :!chmod +x %<cr>
nnoremap du                 :diffupdate<cr>
nnoremap ga                 :Gwrite<cr>
nnoremap gb                 :Gblame<cr>
nnoremap gd                 :Gdiff<cr><c-w>h
nnoremap gh                 :Gbrowse<cr>
nnoremap gl                 :Glog<cr>
nnoremap gm                 :Gcommit<cr>i
nnoremap gpl                :Git pull<cr>
nnoremap gpp                :Git push<cr>
nnoremap gr                 :Ggrep<space>
nnoremap gs                 :Gstatus<cr>
nnoremap q                  :quit<cr>

" Leader Mappings {{{2

nnoremap <leader><tab>      <tab>
nnoremap <leader>.          :edit .<cr>
nnoremap <leader>=          m`=ip``
nnoremap <leader>\|         :vsplit<cr>
nnoremap <leader>_          :split<cr>
nnoremap <leader>H          H
nnoremap <leader>J          J
nnoremap <leader>K          K
nnoremap <leader>L          L
nnoremap <leader>U          U
nnoremap <leader>bw         :bwipeout!<cr>
nnoremap <leader>e          :edit<space>
nnoremap <leader>ga         ga
nnoremap <leader>gd         gd
nnoremap <leader>gh         gh
nnoremap <leader>gm         gm
nnoremap <leader>gr         gr
nnoremap <leader>gs         gs
nnoremap <leader>h          :help<space>
nnoremap <leader>ls         :ls<cr>
nnoremap <leader>m          :make<cr>
nnoremap <leader>q          :quit!<cr>
nnoremap <leader>r          :source $MYVIMRC<cr>
nnoremap <leader>s          :split<space>
nnoremap <leader>t          :tabnew<space>
nnoremap <leader>v          :tabedit $MYVIMRC<cr>
nnoremap <leader>x          :xit<cr>
