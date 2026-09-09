" Plugins {{{1

set encoding=utf-8
set exrc
set secure

" vim-plug installs itself on a new machine, then installs the plugins on the
" first launch. https://github.com/junegunn/vim-plug
let s:plug = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:plug)
    silent execute '!curl -fLo ' . shellescape(s:plug) . ' --create-dirs'
                \ . ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug#end() runs "filetype plugin indent on" and "syntax enable" for us.
call plug#begin('~/.vim/plugged')

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'
Plug 'lifepillar/vim-solarized8'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" Vim ships a comment operator (gc/gcc, plus the ac/ic text objects) as an
" optional package, which replaces tpope/vim-commentary.
packadd comment

" Extend % to matching keywords (if/else/endif, HTML tags) via b:match_words,
" and add g%, [% and ]%.
packadd matchit

" Colors {{{1

" Also enabled by plug#end(), but repeated so colours still work if vim-plug
" has not bootstrapped yet.
syntax enable

if has('termguicolors') && ($COLORTERM ==# 'truecolor' || $COLORTERM ==# '24bit')
    set termguicolors
endif

" Keep the terminal's own background showing through across colourscheme
" reloads, including the light/dark toggle below.
augroup vimrc_colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
augroup END

set background=dark
silent! colorscheme solarized8
nnoremap <F6> :let &background = &background ==# 'dark' ? 'light' : 'dark'<cr>

" Highlight trailing whitespace. :match is window-local and is not inherited by
" new windows, so (re)apply it per window rather than once at startup.
function! s:MatchTrailingSpace()
    if !exists('w:trailing_space_match')
        let w:trailing_space_match = matchadd('EndOfLineSpace', '\s\+$')
    endif
endfunction

highlight default link EndOfLineSpace ErrorMsg

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
" Guarded inline rather than at vimrc time: vim-plug only extends
" 'runtimepath' here, so fugitive is not sourced until after this file runs.
set statusline=%<%f\ %h%m%r%{exists('*FugitiveStatusline')?FugitiveStatusline():''}%=%-14.(%l,%c%V%)\ %P

" Search {{{1
set nohlsearch
set incsearch
set smartcase
set wildmode=list:longest
set wildmenu

" Misc {{{1

if !isdirectory($HOME.'/.vimtmp')
    call mkdir($HOME.'/.vimtmp', 'p', 0700)
endif
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//
set foldlevel=3
set nomodeline
set number
set scrolloff=1
set spelllang=en_us

" Filetypes {{{1

set lispwords+=syntax-case,syntax-rules,define-record-type

" Grouped so that re-sourcing this file (<leader>r, <F5>) replaces these
" autocmds instead of stacking another copy of each one.
augroup vimrc
    autocmd!
    autocmd FileType c setlocal cin cino=(0,:0
    autocmd FileType crontab setlocal backupcopy=yes
    autocmd FileType css setlocal shiftwidth=2 softtabstop=2
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitconfig setlocal noexpandtab shiftwidth=8
    autocmd FileType go setlocal noexpandtab shiftwidth=8
    autocmd FileType html setlocal nolinebreak shiftwidth=2 softtabstop=2
                \ textwidth=0
    autocmd FileType htmldjango setlocal nolinebreak shiftwidth=2 softtabstop=2
                \ textwidth=0
    autocmd FileType java setlocal textwidth=100
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
    autocmd FileType javascript nnoremap <LocalLeader>= :0,$!clang-format -assume-filename=.js<CR>
    autocmd FileType json setlocal nolinebreak shiftwidth=2 softtabstop=2
    autocmd FileType mail setlocal spell textwidth=72
    autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
    autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
    autocmd FileType python setlocal textwidth=79
    autocmd FileType vim setlocal foldcolumn=4 foldmethod=marker
    autocmd FileType yaml setlocal nolinebreak shiftwidth=2 softtabstop=2
    autocmd BufNewFile,BufRead *.li set filetype=scheme
    autocmd BufNewFile,BufRead aliases setlocal filetype=sh
    autocmd BufNewFile,BufRead gitconfig setfiletype gitconfig
    autocmd BufNewFile,BufRead profile setlocal filetype=sh
    autocmd VimEnter,WinEnter * call s:MatchTrailingSpace()
    autocmd InsertEnter * hi link EndOfLineSpace Normal
    autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg
augroup END

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
nnoremap gb                 :Git blame<cr>
nnoremap gd                 :Gdiffsplit<cr><c-w>h
nnoremap gh                 :GBrowse<cr>
nnoremap gl                 :Gclog<cr>
nnoremap gm                 :Git commit<cr>i
nnoremap gpl                :Git pull<cr>
nnoremap gpp                :Git push<cr>
nnoremap gr                 :Ggrep<space>
nnoremap gs                 :Git<cr>

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
