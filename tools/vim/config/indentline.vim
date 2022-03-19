" Config: indentline 
" yggdroot/indentline

let g:indentLine_char = '│'

" Don't run on specfic plugins
let g:indentLine_bufNameExclude = ['dashboard-vim']
let g:indentLine_color_term = 237                     " indentline colour
" let g:indentLine_color_term = 237                     " indentline colour
" let g:indentLine_bgcolor_term = 235                   " indentline background colour
let g:indentLine_indentLevel = 50                     " number of indent levels to render
                                                      " since tabspace is 2 and max column is 100
                                                      " therefore it should 100 / 2 = 50 indent levels

" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'