" liuzxiao's vimrc
" GITHUB:https://github.com/Xiao6/vimrc.git 


" athogen.vim: auto load plugins in .vim/bundle
let g:pathogen_disabled = []
if !has('gui_running')
   call add(g:pathogen_disabled, 'powerline')
endif

call pathogen#incubate()
call pathogen#helptags()

" general settings
set number              " show line number
set hlsearch		" search highlighting
syntax on               " syntax highlighting
set laststatus=2        " Always show the statusline
set nobackup		" no *~ backup files
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context


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

map pre :w\|!open %<cr>            " Preview current file(Html...)

" NERDTree
map <C-n> :NERDTreeToggle<CR> " shortcut binding
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif   " close if NERDTree is the last window


