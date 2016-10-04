" color setting
" ====================================
"
if has("gui_running")   " GUI color and font settings
  "color scheme under /colors dir
  try
    syntax enable
    set background=dark	  
    colorscheme solarized
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
  endtry
  "try
  "  set background=dark 
  "  set t_Co=256          " 256 color mode
  "  set cursorline        " highlight current line
  "  colors moria
  "  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
  "catch  /^Vim\%((\a\+)\)\=:E185/
  "  colorscheme desert
  "endtry
else
" terminal color settings
endif

"if &t_Co > 2 || has("gui_running")
     " switch syntax highlighting on, when the terminal has colors
"         syntax on
"endif 
 
