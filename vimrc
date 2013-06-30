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
set noswapfile
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
set expandtab		" tabs mutate into spaces
set hlsearch            " highlight search terms
set incsearch           " incremental search
set hidden              " hides buffers instead of closing them
set nowrap              " don't wrap lines
set tabstop=4           " a tab is four spaces
set backspace=indent,eol,start
                        " allow backspacing over everything in insert mode
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


filetype plugin indent on
if has('autocmd')
        autocmd filetype python set expandtab
endif

if has("gui_running")   " GUI color and font settings
  set guifont=Osaka-Mono:h18
  set background=dark 
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors moria
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
endif

if &t_Co > 2 || has("gui_running")
     " switch syntax highlighting on, when the terminal has colors
         syntax on
endif 
     

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

" clear search highlighting with <leader>/
nmap <silent> <leader>/ :nohlsearch<CR>

" Quickly edit/reload the vimrc file
" http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" preview
map pre :w\|!open %<cr>           

set pastetoggle=<F2>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"************************
" function
"************************

" NERDTree
map <C-n> :NERDTreeToggle<CR> " shortcut binding
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif   " close if NERDTree is the last window
