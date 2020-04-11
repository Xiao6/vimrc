" my vimrc
" GITHUB:https://github.com/Xiao6/vimrc.git 

" BASIC SETUP
" ==========
" makes Vim work without being Vi-compatible, 
" making it all its enhancements/improvements/features available to the user.
set nocompatible

" Vundle
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

" Keep Plugin commands between vundle#begin/end.
Plugin 'henrik/vim-indexed-search'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'andreshazard/vim-logreview'
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
" file system explorer for the Vim editor
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""
" Standard vim options
" ==========
set autoindent            " always set autoindenting on
set backspace=2           " allow backspacing over everything in insert mode
set expandtab             " Get rid of tabs altogether and replace with spaces
set history=50            " keep 50 lines of command line history
set incsearch             " Incremental search
syntax on                 " syntax highlighting
set number                " show line mumber
set hlsearch              " highlight search
set linebreak             " This displays long lines as wrapped at word boundries
set matchtime=10          " Time to flash the brack with showmatch
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set noswapfile
if has ('gui_running')
  set cursorline "hightline current line
endif  
set smartcase               "ignore case if search pattern is all lowercase,case-sensitive otherwise
set backspace=indent,eol,start 
                            "set backspace to delete auto autoindentation, and end of line and over start of insertion

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2

let g:lightline = {
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
    \   'component': {
    \     'lineinfo': ' %3l:%-2v',
    \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
    \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
    \   'left': '', 'right': '' 
  \}

let g:gitgutter_grep=''

" ctrlp settings
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"When invoked without an explicit starting directory, CtrlP will set its local
"working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'

" NerdTree Settings
" Key mapping Ctrl+n to open NerdTree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" preview
map pre :w\|!open %<cr>           

set pastetoggle=<F2>
" set *.md to use markdown syntax
autocmd BufNewFile,BufRead *.md set filetype=markdown


" Load custom settings
if has ('win32')
  source $VIM/vimfiles/startup/color.vim
endif

" FONT and THEME
" ==========
set guifont=JetBrainsMono-Regular:h14

set background=dark " for the dark version
colorscheme gruvbox

" AUTO CLOSE BRACKET
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
