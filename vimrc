" my vimrc
" GITHUB:https://github.com/Xiao6/vimrc.git 

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
if has ('unix')
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  elseif has ('win_32')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$HOME/vimfiles/bundle/')
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Dstraction-free writing in Vim.  - https://github.com/junegunn/goyo.vim
Plugin 'junegunn/goyo.vim'
" This is a Vim extension that emulates iA Writer environment - https://github.com/amix/vimrc/tree/master/sources_non_forked/vim-zenroom2
Plugin 'amix/vim-zenroom2'
" Display buffer instead of tabs  - https://github.com/ap/vim-buftabline
Plugin 'bling/vim-bufferline'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""

syntax on                   "syntax highlighting
set number                  "show line mumber
set incsearch               "incremental search
set hlsearch                "highlight search
set nobackup                "get rid of anoying ~file
set noswapfile
if has ('gui_running')
  set cursorline "hightline current line
endif  
set ignorecase              "ignore case when searching
set smartcase               "ignore case if search pattern is all lowercase,case-sensitive otherwise
set backspace=indent,eol,start 
                            "set backspace to delete auto autoindentation, and end of line and over start of insertion

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab



" Load custom settings
source ~/.vim/startup/color.vim

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}

""
" SHORTCUTS
""
" set leader to ,
let mapleader=","
let g:mapleader=","

" Quickly edit/reload the vimrc file
" http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" preview
map pre :w\|!open %<cr>           

set pastetoggle=<F2>

" Goyo settings 
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

" set *.md to use markdown syntax
autocmd BufNewFile,BufRead *.md set filetype=markdown

" markdown preview
if has('gui_win32') 
  autocmd BufEnter *.md silent! exe 'noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>'
endif

" Load custom settings
if has ('win32')
  source $VIM/vimfiles/startup/color.vim
endif
if has ('unix')
  source ~/.vim/startup/color.vim
endif
