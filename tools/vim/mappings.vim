" ------------------------------------------------------------------------------
" # Mappings
" ------------------------------------------------------------------------------
" # All of your mappings go in this file! Don't worry about your mappings
" # being separate from related config. Sourcery provides mappings to
" # easily jump between plugin definitions, mappings, and configs.
" #
" # More info: https://github.com/jesseleite/vim-sourcery#jumping-between-files

setlocal foldmethod=marker

" Map leader
let mapleader = "\<Space>"

" SOURCERY MAPPINGS ------------------------------------------------------------------- {{{

" Mappings: sourcery
" https://github.com/jesseleite/vim-sourcery#installation
function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction

" }}}

" NERDTREE MAPPINGS ------------------------------------------------------------------- {{{

" Mappings: nerdtree
" https://github.com/preservim/nerdtree#how-can-i-map-a-specific-key-or-shortcut-to-open-nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>    " Toggle NERDTree with Ctrl + n

" }}}

" Mappings: NERDCommenter
" map // <plug>NERDCommenterToggle      " Turn current line into a comment by pressing / twice in normal mode
                                      " NOTE: iTerm2 has a key map of ctrl + / that will send // in vim

" TAGBAR MAPPINGS --------------------------------------------------------------------- {{{

" Mappings: TagBar
" https://github.com/preservim/tagbar#quickstart
" Toggle TagBar plugin using F8 key
nmap <F8> :TagbarToggle<CR>

" }}}

" FLOATERM MAPPINGS ------------------------------------------------------------------- {{{

" Mappings:floaterm
" https://github.com/voldikss/vim-floaterm#commands
" https://github.com/voldikss/vim-floaterm#keymaps
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

" }}}

" DASHBOARD MAPPINGS ------------------------------------------------------------------ {{{

" Mappings: dashboard
" https://github.com/glepnir/dashboard-nvim
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>cn :<C-u>DashboardNewFile<CR>

" }}}

" FZF MAPPINGS ------------------------------------------------------------------------ {{{

" Fzf fuzzy finders
" Mappings: fzf
" https://github.com/junegunn/fzf.vim#commands
" nmap <Leader>f :GFiles<CR>
" nmap <Leader>F :Files<CR>
" nmap <Leader>b :Buffers<CR>
" nmap <Leader>l :BLines<CR>
nmap <C-h> :Helptags!<CR>
nnoremap <silent> <Leader>fb :Marks<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fa :Rg<CR>

" }}}

