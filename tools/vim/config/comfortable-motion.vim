" Config: comfortable-motion
" yuttie/comfortable-motion.vim

" mouse support
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(90)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-90)<CR>