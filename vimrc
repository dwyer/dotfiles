" vundle stuff {{{1
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
"Bundle 'msanders/cocoa.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

" Syntax {{{1
syntax on
highlight Normal ctermbg=none
set background=dark
set t_Co=256
if filereadable($HOME.'/.vim/bundle/vim-colors-solarized/README.mkd')
    colorscheme solarized
    call togglebg#map("<F5>")
endif

" format and indentation {{{1
set autoindent
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set colorcolumn=+0
set expandtab
set linebreak
set shiftwidth=4
set nosmartindent
set softtabstop=4
set tabstop=8
set textwidth=80

" misc {{{1
if !filereadable($HOME.'/.vimtmp/.keep')
    silent !mkdir -p ~/.vimtmp
    silent !touch ~/.vimtmp/.keep
    set backupdir=~/.vimtmp//
    set directory=~/.vimtmp//
endif
set cryptmethod=blowfish
set foldlevel=3
set nohidden
set nomodeline                  " freebsd paranoia
set number

" status line {{{1
set laststatus=2
set ruler
if filereadable($HOME.'/.vim/bundle/vim-fugitive/README.markdown')
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" search {{{1
set nohlsearch
set incsearch
set ignorecase
set smartcase
set wildmode=list:longest

" filetypes {{{1
filetype plugin indent on
function! ObjcFold()
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
autocmd FileType c setlocal cin cino=(0 cino=:0 tw=80
autocmd FileType gitcommit setlocal spell
autocmd FileType html setlocal nolinebreak shiftwidth=2
autocmd FileType htmldjango setlocal nolinebreak shiftwidth=2
autocmd FileType java setlocal textwidth=100
autocmd FileType lisp setlocal lispwords+=syntax-rules
autocmd FileType mail setlocal spell textwidth=72
autocmd FileType objc setlocal foldcolumn=4 foldexpr=ObjcFold() foldmethod=expr foldtext=getline(v:foldstart) nolinebreak
autocmd FileType vim setlocal foldcolumn=1 foldmethod=marker
autocmd FileType xml setlocal shiftwidth=4
autocmd BufNewFile,BufRead *.gyp setlocal filetype=python
autocmd BufNewFile,BufRead *.json setlocal filetype=javascript
autocmd BufNewFile,BufRead *.li setlocal filetype=li lisp
autocmd BufNewFile,BufRead *.m setlocal filetype=objc
autocmd BufNewFile,BufRead *.muttrc setlocal filetype=muttrc
autocmd BufNewFile,BufRead *.sub setlocal filetype=sub lisp
autocmd BufNewFile,BufRead gitconfig setlocal filetype=gitconfig
autocmd BufNewFile,BufRead mutt-* setlocal filetype=mail
autocmd BufNewFile,BufRead profile setlocal filetype=sh

" key bindings {{{1
nnoremap <space>        :write<cr>
nnoremap <c-h>          H
nnoremap <c-j>          J
nnoremap <c-k>          K
nnoremap <c-l>          L
nnoremap <tab>          <c-w>
nnoremap <tab><tab>     <c-w><c-w>
nnoremap +              za
nnoremap !              :!
nnoremap !!             :!!<cr>
nnoremap ;              :
nnoremap \q             :nohlsearch<cr>
nnoremap H              ^
nnoremap J              <c-d>
nnoremap K              <c-u>
nnoremap L              $
nnoremap U              <c-r>
nnoremap cx             :!chmod +x %<cr>
nnoremap du             :diffupdate<cr>
nnoremap ga             :Gwrite<cr>
nnoremap gb             :Gblame<cr>
nnoremap gc             :Gcommit<cr>
nnoremap gd             :Gdiff<cr>
nnoremap gh             :Gbrowse<cr>
nnoremap gl             :Glog<cr>
nnoremap gm             :Gmove<space>
nnoremap gp             <nop>
nnoremap gpp            :Git push<cr>
nnoremap gpl            :Git pull<cr>
nnoremap gv             :Gvsplit<cr>
"nnoremap gr             :Gremove<cr>
nnoremap gr             :Ggrep<space>
nnoremap gs             :Gstatus<cr>
nnoremap q              :quit<cr>
nnoremap vs             :vsplit<space>

"leader key bindings {{{1
let mapleader = ','
nnoremap <leader>.      :edit .<cr>
nnoremap <leader>S      :split .<cr>
nnoremap <leader>V      :vsplit .<cr>
nnoremap <leader>b1     :buffer 1<cr>
nnoremap <leader>b2     :buffer 2<cr>
nnoremap <leader>b3     :buffer 3<cr>
nnoremap <leader>b4     :buffer 4<cr>
nnoremap <leader>b5     :buffer 5<cr>
nnoremap <leader>b6     :buffer 6<cr>
nnoremap <leader>b7     :buffer 7<cr>
nnoremap <leader>b8     :buffer 8<cr>
nnoremap <leader>b9     :buffer 9<cr>
nnoremap <leader>bn     :bnext<cr>
nnoremap <leader>bs     :buffers<cr>
nnoremap <leader>bw     :bwipeout!<cr>
nnoremap <leader>e      :edit<space>
nnoremap <leader>h      :help<space>
nnoremap <leader>m      :make<cr>
"nnoremap <leader>n      :tabn<cr>
nnoremap <leader>o      :only<cr>
"nnoremap <leader>p      :tabp<cr>
nnoremap <leader>q      q
nnoremap <leader>r      :source $MYVIMRC<cr>
nnoremap <leader>s      :split<space>
nnoremap <leader>t      :tabnew<space>
nnoremap <leader>v      :vsplit<space>
nnoremap <leader>x      :xit<cr>
nnoremap <leader>{      =i{

