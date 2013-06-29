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
syntax on
set laststatus=2   " Always show the statusline


" NERDTree
map <C-n> :NERDTreeToggle<CR> " shortcut binding
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif   " close if NERDTree is the last window


