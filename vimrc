" vundle {{{1

set encoding=utf-8
set fileencoding=utf-8

if !filereadable($HOME.'/.vim/bundle/vundle/README.md')
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'dwyer/li.vim'
Bundle 'godlygeek/tabular'
Bundle 'gmarik/vundle'
Bundle 'sjl/gundo.vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jamessan/vim-gnupg'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

filetype plugin indent on

" Syntax Highlighting {{{1

syntax enable
set t_Co=256
if filereadable($HOME.'/.vim/bundle/vim-colors-solarized/README.mkd')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
    call togglebg#map("<F6>")
    highlight Normal ctermbg=none
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
endif

" Format and Indentation {{{1

set autoindent
set backspace=indent,eol,start
set colorcolumn=+0
set expandtab
set linebreak
set shiftwidth=4
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

if !isdirectory($HOME.'/.vimtmp')
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

function! DjangoTagCleanup()
    :%s/{%\s*/{% /g
    :%s/\s*%}/ %}/g
    :%s/{{\s*/{{ /g
    :%s/\s*}}/ }}/g
endfunction

if has('autocmd')
    autocmd FileType c setlocal cin cino=(0 cino=:0
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitconfig setlocal noexpandtab shiftwidth=8
    autocmd FileType html setlocal nolinebreak
    autocmd FileType htmldjango setlocal nolinebreak
    autocmd FileType java setlocal textwidth=100
    autocmd FileType li setlocal lisp
    autocmd FileType lisp setlocal lispwords+=syntax-rules
    autocmd FileType mail setlocal spell textwidth=72
    autocmd FileType objc setlocal foldcolumn=4 foldexpr=ObjcFold() 
                \ foldmethod=expr foldtext=getline(v:foldstart) nolinebreak
    autocmd FileType python setlocal textwidth=79
    autocmd FileType vim setlocal foldcolumn=4 foldmethod=marker
    autocmd BufNewFile,BufRead *.gyp setfiletype python
    autocmd BufNewFile,BufRead *.json setfiletype javascript
    autocmd BufNewFile,BufRead *.li,*.sub setfiletype li
    autocmd BufNewFile,BufRead *.m setfiletype objc
    autocmd BufNewFile,BufRead *.muttrc setfiletype muttrc
    autocmd BufNewFile,BufRead *.pch setfiletype objc
    autocmd BufNewFile,BufRead gitconfig setfiletype gitconfig
    autocmd BufNewFile,BufRead mutt-* setfiletype mail
    autocmd BufNewFile,BufRead profile setlocal filetype=sh
endif

" Mappings {{{1

" Normal mappings {{{2

" Quit {{{3
" Use q to quit, Q to record and bring up command windows, LEADER-Q to bring up
" ex mode. 
nnoremap <leader>Q          Q
nnoremap <leader>q          :quit!<cr>
nnoremap Q                  q
nnoremap q                  :quit<cr>

" Navigation {{{3
" Use H and L to go to beginning and end of a line. J and K to go up and down
" (half) a page. These keys have been remapped to CTRL. I didn't remap the CTRL
" keys to LEADER because they're not very useful.
nnoremap <c-h>              H
nnoremap <c-j>              J
nnoremap <c-k>              K
nnoremap <c-l>              L
nnoremap H                  ^
nnoremap J                  <c-d>
nnoremap K                  <c-u>
nnoremap L                  $

" Undo/Redo {{{3
" Use U to redo, CTRL-u to toggle undo the current line. K replaces CTRL-u (see
" Navigation).
nnoremap <c-r>              :echo "Use U instead."<cr>
nnoremap <c-u>              U
nnoremap U                  <c-r>

" Windows {{{3
" Use TAB as the window prefix. Use CTRL-p to move forward through the jump
" list. Since CTRL-p is the same as k, don't bother mapping it to a LEADER key.
nnoremap <c-p>              <tab>
nnoremap <tab>              <c-w>
nnoremap <tab><tab>         <c-w>w

" Shell {{{3
" Use ! to execute a shell command. !! to execute the last command. Filter shell
" commands have been remapped t LEADER-!.
nnoremap <leader>!          !
nnoremap !                  :!
nnoremap !!                 :!!<cr>

" Git {{{3
" All fugitive commands are prefixed with the g key. Overridden g keys have been
" remapped to LEADER." TODO: check that fugitive is installed before doing this.
nnoremap <leader>ga         ga
nnoremap <leader>gd         gd
nnoremap <leader>gh         gh
nnoremap <leader>gm         gm
nnoremap <leader>gr         gr
nnoremap <leader>gs         gs
nnoremap ga                 :Gwrite<cr>
nnoremap gb                 :Gblame<cr>
nnoremap gd                 :Gdiff<cr><c-w>h
nnoremap gh                 :Gbrowse<cr>
nnoremap gl                 :Glog<cr>
nnoremap gm                 :Gcommit -s<cr>i
nnoremap gpl                :Git pull<cr>
nnoremap gpp                :Git push<cr>
nnoremap gr                 :Ggrep<space>
nnoremap gs                 :Gstatus<cr>

" Other {{{3
set pastetoggle=<leader>p
nnoremap <leader>.          :edit .<cr>
nnoremap <leader>=          m`=ip``
nnoremap <leader>\|         :vsplit<cr>
nnoremap <leader>_          :split<cr>
nnoremap <leader>bw         :bwipeout!<cr>
nnoremap <leader>e          :edit<space>
nnoremap <leader>h          :help<space>
nnoremap <leader>ls         :ls<cr>
nnoremap <leader>m          :make<cr>
nnoremap <leader>r          :source $MYVIMRC<cr>
nnoremap <leader>s          :split<space>
nnoremap <leader>t          :tabnew<space>
nnoremap <leader>v          :tabedit $MYVIMRC<cr>
nnoremap <leader>x          :xit<cr>
nnoremap <cr>               za
nnoremap <f5>               :source $MYVIMRC<cr>
nnoremap <space>            :write<cr>
nnoremap cx                 :!chmod +x %<cr>
nnoremap du                 :diffupdate<cr>
nnoremap zz                 za
inoremap {<cr>              {<cr>}<esc>O
